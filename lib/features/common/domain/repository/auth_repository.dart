import 'package:flutter_template/features/common/domain/entity/auth/auth_state.dart';
import 'package:flutter_template/features/common/domain/entity/auth/otp_token_entity.dart';
import 'package:flutter_template/features/common/domain/entity/operation/request_operation.dart';
import 'package:flutter_template/features/common/domain/entity/user/user_profile_entity.dart';

/// {@template auth_repository.class}
/// Interface for the authentication repository.
/// SSOT (Single Source of Truth) for authentication for the entire application.
/// {@endtemplate}
abstract interface class IAuthRepository {
  /// Stream with authentication state
  Stream<AuthState> get authState;

  /// Current authentication state
  AuthState get currentAuthState;

  /// Initialize repository
  RequestOperation<void> init();

  /// Get otp-token by phone number
  RequestOperation<OtpTokenEntity> otpToken(String phone);

  /// Verify otp-code.
  /// Successful completion of the request - the user is authorized.
  RequestOperation<UserProfileEntity> verifyOtp(String otpToken, String otpCode);

  /// logout
  RequestOperation<void> logout({bool deleteUser = false});

  /// Dispose resources
  void dispose();
}
