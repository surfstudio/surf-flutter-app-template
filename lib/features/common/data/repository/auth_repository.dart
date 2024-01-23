import 'package:dio/dio.dart';
import 'package:flutter_template/api/data/umbrella.dart';
import 'package:flutter_template/api/service/auth/auth_api.dart';
import 'package:flutter_template/api/service/common/common_api.dart';
import 'package:flutter_template/features/common/data/converter/auth/auth_by_code_request_data_converter.dart';
import 'package:flutter_template/features/common/data/converter/auth/auth_by_code_verify_request_data_converter.dart';
import 'package:flutter_template/features/common/data/converter/auth/otp_token_entity_converter.dart';
import 'package:flutter_template/features/common/data/converter/user/user_profile_entity_converter.dart';
import 'package:flutter_template/features/common/data/repository/api_caller_repository_mixin.dart';
import 'package:flutter_template/features/common/domain/entity/auth/auth_state.dart';
import 'package:flutter_template/features/common/domain/entity/auth/otp_token_entity.dart';
import 'package:flutter_template/features/common/domain/entity/operation/failure.dart';
import 'package:flutter_template/features/common/domain/entity/operation/request_operation.dart';
import 'package:flutter_template/features/common/domain/entity/operation/result.dart';
import 'package:flutter_template/features/common/domain/entity/user/user_profile_entity.dart';
import 'package:flutter_template/features/common/domain/repository/auth_repository.dart';
import 'package:flutter_template/features/common/service/error_reports/i_error_reports_service.dart';
import 'package:flutter_template/persistence/storage/first_run/i_first_run_storage.dart';
import 'package:flutter_template/persistence/storage/tokens_storage/i_tokens_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

/// {@template auth_repository.class}
/// Implementation AuthRepository.
/// Conceptually, this class is the business logic of authentication.
/// But due to the lack of classes for pure business logic in the project architecture,
/// it is implemented as a repository.
/// {@endtemplate}
final class AuthRepository with ApiCallerRepositoryMixin implements IAuthRepository {
  final AuthApi _authApi;
  final CommonApi _commonApi;

  final ITokensStorage _tokensStorage;
  final IFirstRunStorage _firstRunStorage;

  final IErrorReportsService _errorReportsService;

  final IAuthByCodeRequestDataConverter _authByCodeRequestDataConverter;
  final IOtpTokenEntityConverter _otpTokenEntityConverter;
  final IAuthByCodeVerifyRequestDataConverter _authByCodeVerifyRequestDataConverter;
  final IUserProfileEntityConverter _userProfileEntityConverter;

  /// {@macro auth_repository.class}
  AuthRepository({
    required AuthApi authApi,
    required CommonApi commonApi,
    required ITokensStorage tokensStorage,
    required IFirstRunStorage firstRunStorage,
    required IErrorReportsService errorReportsService,
    required IAuthByCodeRequestDataConverter authByCodeRequestDataConverter,
    required IOtpTokenEntityConverter otpTokenEntityConverter,
    required IAuthByCodeVerifyRequestDataConverter authByCodeVerifyRequestDataConverter,
    required IUserProfileEntityConverter userProfileEntityConverter,
  })  : _authApi = authApi,
        _commonApi = commonApi,
        _tokensStorage = tokensStorage,
        _firstRunStorage = firstRunStorage,
        _errorReportsService = errorReportsService,
        _authByCodeRequestDataConverter = authByCodeRequestDataConverter,
        _otpTokenEntityConverter = otpTokenEntityConverter,
        _authByCodeVerifyRequestDataConverter = authByCodeVerifyRequestDataConverter,
        _userProfileEntityConverter = userProfileEntityConverter;

  final _authSubject = BehaviorSubject<AuthState>();

  @override
  Stream<AuthState> get authState => _authSubject.stream;

  @override
  AuthState get currentAuthState => _authSubject.valueOrNull ?? AuthState.unauthenticated;

  @override
  RequestOperation<void> init() async {
    try {
      await _checkFirstRun();
      final token = await _tokensStorage.accessToken();

      _authSubject.add(token != null ? AuthState.authenticated : AuthState.unauthenticated);

      return const Result.ok(null);
    } on Exception catch (e, s) {
      _authSubject.add(AuthState.unauthenticated);

      return Result.failed(Failure(original: e, trace: s));
    }
  }

  @override
  RequestOperation<OtpTokenEntity> otpToken(String phone) async {
    try {
      final response = await _authApi.postOtp(_authByCodeRequestDataConverter.convert(phone));

      return Result.ok(_otpTokenEntityConverter.convert(response));
    } on DioError catch (e, s) {
      return Result.failed(mapApiError(e, trace: s));
    } on Exception catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }

  @override
  RequestOperation<UserProfileEntity> verifyOtp(String otpToken, String otpCode) async {
    try {
      final response = await _authApi
          .postVerify(_authByCodeVerifyRequestDataConverter.convert((otpToken, otpCode)));

      await _saveTokens(response);

      _authSubject.add(AuthState.authenticated);

      return Result.ok(_userProfileEntityConverter.convert(response.user));
    } on DioError catch (e, s) {
      return Result.failed(mapApiError(e, trace: s));
    } on Exception catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }

  @override
  RequestOperation<void> logout({bool deleteUser = false}) async {
    try {
      _authSubject.add(AuthState.unauthenticated);

      await _logout(deleteUser: deleteUser);

      await _tokensStorage.clear();

      return const Result.ok(null);
    } on Exception catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }

  @override
  void dispose() {
    _authSubject.close();
  }

  Future<void> _saveTokens(AuthResponseData authResponse) async {
    await _tokensStorage.saveAccessToken(authResponse.tokens.accessToken);
    await _tokensStorage.saveRefreshToken(authResponse.tokens.refreshToken);
  }

  Future<void> _checkFirstRun() async {
    final isFirstRun = _firstRunStorage.getIsFirstRun();

    if (isFirstRun) {
      await _firstRunStorage.setIsFirstRun(value: false);

      final result = await logout();
      _handleResultFailure(result);
    }
  }

  Future<void> _logout({bool deleteUser = false}) async {
    final result = await _logoutRequest(deleteUser: deleteUser);
    _handleResultFailure(result);
  }

  RequestOperation<void> _logoutRequest({bool deleteUser = false}) async {
    try {
      await _commonApi.postLogout(
        LogoutRequestData(
          deviceId: const Uuid().v4(),
          deleteUser: deleteUser,
        ),
      );

      return const Result.ok(null);
    } on DioError catch (e, s) {
      return Result.failed(mapApiError(e, trace: s));
    } on Exception catch (e, s) {
      return Result.failed(Failure(original: e, trace: s));
    }
  }

  void _handleResultFailure<T>(Result<T, Failure> result) {
    switch (result) {
      case ResultFailed(:final failure):
        _errorReportsService.recordFailure(failure);
      default:
        break;
    }
  }
}
