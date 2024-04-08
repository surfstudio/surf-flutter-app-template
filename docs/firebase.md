# Firebase

## Configuration

To use Firebase in your project, you need to do the following:

1. If you haven't already, install [Firebase CLI](https://firebase.google.com/docs/cli).
2. Log in to Firebase CLI with your Google account:

   ```sh
   firebase login
   ```

3. Create project at [Firebase Console](https://console.firebase.google.com/).

- In the [Firebase console](https://console.firebase.google.com), click Add project. To add Firebase resources to an existing Google Cloud project, enter its project name or select it from the dropdown menu. To create a new project, enter the desired project name. You can also optionally edit the project ID displayed below the project name.

- If prompted, review and accept the [Firebase terms](https://firebase.google.com/terms).

- Click Continue.

- (Optional) Set up Google Analytics for your project, which enables you to have an optimal experience using any of the Firebase products. Either select an existing [Google Analytics account](https://support.google.com/analytics/answer/1009618?ref_topic=3544906&authuser=0#zippy=%2Cin-this-article) or to create a new account. If you create a new account, select your [Analytics reporting location](https://firebase.google.com/docs/projects/locations), then accept the data sharing settings and Google Analytics terms for your project. You can always set up Google Analytics later in the [Integrations](https://console.firebase.google.com/project/_/settings/integrations) tab of your settings Project settings.

- Click Create project (or Add Firebase, if you're using an existing Google Cloud project).

4. Configure app for desired platform.

### Android

[Actual offical guide.](https://firebase.google.com/docs/android/setup)

- In the center of the project overview page, click the Android icon (plat_android) or Add app to launch the setup workflow.

- Enter your app's package name in the Android package name field. The current package name can be found in your module (app-level) Gradle file, usually android/app/build.gradle, defaultConfig section (example package name: com.yourcompany.yourproject).

- (Optional) Enter other app information: App nickname and Debug signing certificate SHA-1.

- Click Register app.

- Download and then add the Firebase Android configuration file (google-services.json) to your app. Click Download google-services.json to obtain your Firebase Android config file. Move your config file into the module (app-level) root directory of your app.

- In your root-level (project-level) Gradle file (```<project>/build.gradle```), add the Google services plugin as a dependency:

```gradle
plugins {
  id 'com.android.application' version '7.3.0' apply false
  // ...

  // Add the dependency for the Google services Gradle plugin
  id 'com.google.gms.google-services' version '4.4.1' apply false
}
```

- In your module (app-level) Gradle file (```<project>/<app-module>/build.gradle```), add the Google services plugin:

```gradle
plugins {
  id 'com.android.application'

  // Add the Google services Gradle plugin
  id 'com.google.gms.google-services'
  // ...
}
```

- In your module (app-level) Gradle file (```<project>/<app-module>/build.gradle```), add the dependencies for the Firebase products that you want to use in your app. We recommend using the Firebase Android BoM to control library versioning.

```gradle
dependencies {
  // ...

  // Import the Firebase BoM
  implementation(platform("com.google.firebase:firebase-bom:32.8.0"))

  // When using the BoM, you don't specify versions in Firebase library dependencies

  // Add the dependency for the Firebase SDK for Google Analytics
  implementation("com.google.firebase:firebase-analytics")

  // TODO: Add the dependencies for any other Firebase products you want to use
  // See https://firebase.google.com/docs/android/setup#available-libraries
  // For example, add the dependencies for Firebase Authentication and Cloud Firestore
  implementation("com.google.firebase:firebase-auth")
  implementation("com.google.firebase:firebase-firestore")
}
```

### [iOS](https://firebase.google.com/docs/ios/setup)

### [Web](https://firebase.google.com/docs/web/setup)

- In the center of the project overview page, click the Web icon (web_android) or Add app to launch the setup workflow.

- Enter your app's name in the app nickname field.

- Select 'Use a ```<script>``` tag'.

- Copy and paste these scripts into the bottom of your ```<body>``` tag, but before you use any Firebase services.

5. Pass generated `DefaultFirebaseOptions` to `Environment` in entry point of your app:

   ```dart
    /// Main entry point of app.
    void main() {
      Environment.init(
        buildType: BuildType.debug,
        config: AppConfig(
          url: Url.testUrl,
        ),
       firebaseOptions: DefaultFirebaseOptions.currentPlatform,
      );

      run();
    }
   ```

> [!WARNING]
> Make sure that you use correct Firebase options for current entry point (e.g. `firebase_options_dev.dart` for `lib/main.dart` and `firebase_options.dart` for `lib/main_release.dart`).

## Readable crash reports in the Crashlytics dashboard

To set up uploading dsym to firebase on iOS, you need to follow steps 6 and 7 from the instructions above for each flavor.

To download dsym to Android you need to call the command

```sh
firebase crashlytics:symbols:upload --app=FIREBASE_APP_ID PATH/TO/symbols
```

More details are described in [this guide](https://firebase.google.com/docs/crashlytics/get-deobfuscated-reports?platform=flutter) outlines what the automation does and provides first steps to debug your project setup.
