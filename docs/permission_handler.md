
# Permission Handler

The guide describes how to use work with permissions in Flutter.

# permission_handler

[**permission_handler**](https://pub.dev/packages/permission_handler) is a permissions plugin for  
Flutter. This plugin provides a cross-platform (iOS, Android, Web, Windows) API to request and check  
permissions.

## Setup

1) Add permission_handler to your project using the instructions from [pub.dev](https://pub.dev/packages/permission_handler)
2) Create 'permissions' feature, using the masson.
3) In the 'permissions/domain/entities/failure' directory create the file 'permission_failure.dart':

```dart 
/// Statuses of the user permission request error.  
sealed class PermissionFailure extends Failure {  
 PermissionFailure({required super.original, required super.trace});}  
  
/// Access denied.  
final class PermissionDenied extends PermissionFailure {  
 /// Create an instance of [PermissionDenied].
 PermissionDenied({required super.original, required super.trace});}  
  
/// Access denied forever.  
final class PermissionDeniedForever extends PermissionFailure {  
 /// Create an instance of [PermissionDeniedForever].
 PermissionDeniedForever({required super.original, required super.trace});}  
  
/// Service unavailable.  
final class ServiceDisabled extends PermissionFailure {  
 /// Create an instance of [ServiceDisabled].
 ServiceDisabled({required super.original, required super.trace});}  
  
/// Other errors when requesting user permissions.  
final class PermissionException extends PermissionFailure {  
 /// Create an instance of [PermissionException].
 PermissionException({required super.original, required super.trace});}  
```  

4) In the `permissions/domain/repositorie` directory create the file `i_permission_handler_repository.dart`:

```dart  
/// Typedef for the result of a request for user permissions.  
typedef PermissionResult = Result<void, PermissionFailure>;  
  
/// Interface of the repository for obtaining permissions from the user.  
abstract class IPermissionHandlerRepository {  
  /// Check the permission for the use of [permission].
  Future<PermissionResult> checkPermission(Permission permission);
}  
```  

5) In the `permissions/data/repositories` directory create the  
   file `permission_handler_repository.dart`:

```dart  
 /// Implementation of [PermissionHandlerRepository] for obtaining permissions from the user.class PermissionHandlerRepository implements IPermissionHandlerRepository {  
 /// Create an instance of [PermissionHandlerRepository]. PermissionHandlerRepository();  
 @override Future<PermissionResult> checkPermission(Permission permission) async { final status = await permission.status;  
 if (status.isGranted) { return const Result.ok(null); }  
 if (status.isDenied) { final status = await permission.request();  
 if (status.isGranted) { return const Result.ok(null); } else { return Result.failed(PermissionDenied(original: null, trace: null)); } }  
 if (status.isPermanentlyDenied) { return Result.failed(PermissionDeniedForever(original: null, trace: null)); }  
 return Result.failed(PermissionException(original: null, trace: null)); }}  
```  

6) Open the 'lib/features/app/di/app_scope' file.  
   Add the getter 'PermissionHandlerRepository' to the 'IAppScope' class:

```dart  
 /// Permission handler repository.
 IPermissionHandlerRepository get permissionHandlerRepository;  
```  
In the 'AppScope' class, add the 'PermissionHandlerRepository' variable:

```dart  
...  
@override  
final IPermissionHandlerRepository permissionHandlerRepository;  
...  
AppScope({  
...  
required this.permissionHandlerRepository,  
...  
});  
```  

7) Open the 'lib/features/app/di/app_scope_register.dart' file.
   In the 'AppScopeRegister' class, create the 'PermissionHandlerRepository' instance:

```dart  
 final permissionHandlerRepository = PermissionHandlerRepository();  
```  
and pass it to the 'AppScope' constructor.

```dart  
 return AppScope(  
  ...  
  permissionHandlerRepository: permissionHandlerRepository,
  ...
  );
```  

8) Now you can get the permissions repository from the context.
```dart  
 final permissionRepo = context.read<IAppScope>().permissionHandlerRepository;  
```
