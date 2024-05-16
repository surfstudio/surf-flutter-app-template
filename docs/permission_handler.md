
# Permission Handler

The guide describes how to use work with permissions in Flutter.

# permission_handler

[**permission_handler**](https://pub.dev/packages/permission_handler) is a permissions plugin for  
Flutter. This plugin provides a cross-platform (iOS, Android, Web, Windows) API to request and check  
permissions.

## Setup
Add permission_handler to your pubspec.yaml file.

### Android:
In the AndroidManifest.xml file, add the permissions you need.
For example, to request the camera permission, add the following line:
```xml
<uses-permission android:name="android.permission.CAMERA"/>
```
[AndroidManifest example](https://github.com/Baseflow/flutter-permission-handler/blob/main/permission_handler/example/android/app/src/main/AndroidManifest.xml)

### IOS:
In the Info.plist file, add the permissions you need.
For example, to request the camera permission, add the following line:
```xml
<key>NSCameraUsageDescription</key>
<string>camera</string>
```
[Info.plist example](https://github.com/Baseflow/flutter-permission-handler/blob/main/permission_handler/example/ios/Runner/Info.plist)
In the Podfile file, you must describe the permissions you need:
```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
    # YOUR CUSTOM TARGET CODE HERE.
      target.build_configurations.each do |config|
        config.build_settings['ENABLE_BITCODE'] = 'NO'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
          '$(inherited)',
            ## dart: PermissionGroup.camera
            'PERMISSION_CAMERA=1',
        ]
      end
  end
end
```
## Usage
Create 'permissions' feature, using the masson.

In the 'permissions/domain/entities/failure' directory create the file 'permission_failure.dart':
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

In the `permissions/domain/repositories` directory create the file `i_permission_handler_repository.dart`:
```dart  
/// Typedef for the result of a request for user permissions.  
typedef PermissionResult = Result<void, PermissionFailure>;  
  
/// Interface of the repository for obtaining permissions from the user.  
abstract class IPermissionHandlerRepository {  
  /// Check the permission for the use of [permission].
  Future<PermissionResult> checkPermission(Permission permission);
}  
```  

In the `permissions/data/repositories` directory create the file `permission_handler_repository.dart`:
```dart  
 /// Implementation of [PermissionHandlerRepository] for obtaining permissions from the user.
class PermissionHandlerRepository implements IPermissionHandlerRepository {
  /// Create an instance of [PermissionHandlerRepository]. 
  PermissionHandlerRepository();

  @override Future<PermissionResult> checkPermission(Permission permission) async {
    final status = await permission.status;
    if (status.isGranted) {
      return const Result.ok(null);
    }
    if (status.isDenied) {
      final status = await permission.request();
      if (status.isGranted) {
        return const Result.ok(null);
      } else {
        return Result.failed(PermissionDenied(original: null, trace: null));
      }
    }
    if (status.isPermanentlyDenied) {
      return Result.failed(PermissionDeniedForever(original: null, trace: null));
    }
    return Result.failed(PermissionException(original: null, trace: null));
  }
}  
```  

Open the 'lib/features/app/di/app_scope' file.  
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

Open the 'lib/features/app/di/app_scope_register.dart' file.
In the 'AppScopeRegister' class, create the 'PermissionHandlerRepository' instance:
```dart  
 final permissionHandlerRepository = PermissionHandlerRepository();  
```  

and pass it to the 'AppScope' constructor:
```dart  
return AppScope(  
  ...  
  permissionHandlerRepository: permissionHandlerRepository,
  ...
);
```  

Now you can get the permissions repository from the context.
```dart  
 final permissionRepo = context.read<IAppScope>().permissionHandlerRepository;  
```
