# Flavors

## Android

To add a new flavor, you need to open [`android/app/build.gradle`](android/app/build.gradle) file and find the following code:

```groovy   
 flavorDimensions "release-type"

 productFlavors {
     dev {
         dimension "release-type"
         applicationIdSuffix ".dev"
         versionNameSuffix "-dev"
     }
     prod {
         dimension "release-type"
     }
 }
```

You have to add your custom flavor to the `productFlavors` section. 

For example:

```groovy
 flavorDimensions "release-type"

 productFlavors {
     dev {
         dimension "release-type"
         applicationIdSuffix ".dev"
         versionNameSuffix "-dev"
     }
     prod {
         dimension "release-type"
     }
     qa {
         dimension "release-type"
         applicationIdSuffix ".qa"
         versionNameSuffix "-qa"
     }
 }
```

You also can create directory for your flavor in [`android/app/src`](android/app/src) directory. 

For example, if you have files that are used only in your flavor (e.g. launch icons, splash, app name, etc), you can create directory `qa` in `android/app/src` and put your files there.

## iOS

1. Open `Runner.xcworkspace` in Xcode.
2. Create a new configuration file in `ios/Flutter` and name it after your flavor name:

   <img src="/assets/docs/xcode_config_file_creation_1.png" width="400">

   Make sure that you have `Runner` target selected and your file will be placed in `Flutter` folder:

   <img src="/assets/docs/xcode_config_file_creation_2.png" width="400">

3. Paste the following code into your configuration file:

```
 #include "Pods/Target Support Files/Pods-Runner/Pods-Runner.qa.xcconfig"
 #include "Generated.xcconfig"
 #include "common.xcconfig"

 app_icon_suffix=-qa
 bundle_suffix=.qa
 IDENTIFIER=$(identifier)$(bundle_suffix)
 APP_ICON=$(app_icon)$(app_icon_suffix)
```

> Replace `qa` with your flavor name.

4. Go to `Runner -> Project -> Runner -> Info` and duplicate configurations (Debug, Release, Profile (if you need it)) for your new flavor. Postfix for your new configuration should be the same as your flavor name. In our case it is `qa`. So, we'll have `Debug-qa`, `Release-qa`, `Profile-qa`. You also should set correct configuration files for each of your new configuration. In the end you should have something like this:

   <img src="/assets/docs/xcode_configuration_duplication.png" width="500">
5. Go to `Product -> Scheme -> New scheme...` and create new scheme named after your flavor. Make sure that you have `Runner` target selected. In the end you should have something like this:

   <img src="/assets/docs/xcode_scheme_creation.png" width="400">
6. Go to `Product -> Scheme -> Edit scheme...` and select correct Build Configuration for each of scheme:

   <img src="/assets/docs/xcode_scheme_editing.png" width="500">

## Icons configuration

You also can specify different icons for each flavor. To do this, you need to create file `flutter_launcher_icons-{your_flavor_name}.yaml`. E.g. `flutter_launcher_icons-qa.yaml`. Then you can specify path to images, colors and other options for your flavor (read [more](assets/launcher_icon/README.md) about configuration).

Finally, you need to run this command:

```shell
dart run flutter_launcher_icons
```

## IDE Configuration

**VSCode**:

Open `.vscode/launch.json` and add the following code:

```json
{
   "name": "Run qa",
   "request": "launch",
   "type": "dart",
   "args": [
      "--flavor",
       "qa"
   ]
}
```

Now you can launch app with `qa` flavor by clicking on `Run qa` in debug tab:

<img src="/assets/docs/vs_code_flavor_config.png" width="300"/>

**Android Studio**:

Open `Run/Debug Configurations` and add new `Flutter` configuration. In `Build flavor` field add `qa`:

<img src="/assets/docs/android_studio_flavor_config.png" width="800"/>
