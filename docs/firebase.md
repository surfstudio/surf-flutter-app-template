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

- In the center of the project overview page, click the Android icon or Add app to launch the setup workflow.

- Enter your app's package name in the Android package name field. The current package name can be found in your module (app-level) Gradle file, usually android/app/build.gradle, defaultConfig section (example package name: com.yourcompany.yourproject).

- (Optional) Enter other app information: App nickname and Debug signing certificate SHA-1.

- Click Register app.

- Download and then add the Firebase Android configuration file (google-services.json) to your app. Click Download google-services.json to obtain your Firebase Android config file. Move your config file into the module (app-level) root directory of your app.

- Prepare instance of FirebaseOptions. For Android you should provide at least required parameters. It can look like this:

```dart
FirebaseOptions(
    apiKey: 'apiKey',
    appId: 'appId',
    messagingSenderId: 'senderId',
    projectId: 'projectId',
    storageBucket: 'OptionalStorageBucket',
  );
```

1. apiKey can be found inside google-services.json file in client.api_key.current_key.
2. appId can be found inside google-services.json file in client.client_info.mobilesdk_app_id.
3. messagingSenderId can be found in your Firebase Console Project Settings, Cloud Messanging Tab.
4. projectId can be found inside google-services.json file in project_info.project_id.
5. (Optional) storageBucket can be found inside google-services.json file in project_info.storage_bucket.

### iOS

[Actual offical guide.](https://firebase.google.com/docs/ios/setup)

- In the center of the project overview page, click the Ios icon or Add app to launch the setup workflow.

- Enter your app's bundle ID in the bundle ID field. A bundle ID uniquely identifies an application in Apple's ecosystem. Find your bundle ID: open your project in Xcode, select the top-level app in the project navigator, then select the General tab. The value of the Bundle Identifier field is the bundle ID (for example, com.yourcompany.yourproject). Be aware that the bundle ID value is case-sensitive, and it cannot be changed for this Firebase app after it's registered with your Firebase project.

- (Optional) Enter other app information: App nickname and App Store ID.

- Click Register app.

- Click Download GoogleService-Info.plist to obtain your Firebase Apple platforms config file (GoogleService-Info.plist).

- Add the file to the project using Xcode (adding manually via the filesystem won't link the file to the project). Using Xcode, open the project's ios/{projectName}.xcworkspace file. Right click Runner from the left-hand side project navigation within Xcode and select "Add files", select the GoogleService-Info.plist file you downloaded, and ensure the "Copy items if needed" checkbox is enabled.

- Move generated ios/firebase_app_id_file.json to ios/Firebase/{flavor_name} folder - e.g. ios/Firebase/dev/firebase_app_id_file.json.

Move generated ios/Runner/GoogleService-Info.plist to ios/Firebase/{flavor_name} folder - e.g. ios/Firebase/dev/GoogleService-Info.plist.

- The Firebase Emulator Suite uses un-encrypted networking connections in order to enable fast, uncomplicated setup. However iOS by default requires encrypted networking connections. If you would like to use any part of the Firebase Emulator Suite to emulate firebase services on your local machine during development, you must allow your iOS app to connect to local network services over insecure connections. To allow insecure connections, we recommend adding the NSAllowsLocalNetworking key to the NSAppTransportSecurity dictionary in your application's plist file. Add these keys to your ```ios/Runner/Info.plist``` file:

```plist
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsLocalNetworking</key>
    <true/>
</dict>
```

### Web

[Actual offical guide.](https://firebase.google.com/docs/web/setup)

- In the center of the project overview page, click the Web icon or Add app to launch the setup workflow.

- Enter your app's name in the app nickname field.

- Select 'Use a ```<script>``` tag'.

- Copy and paste these scripts into the bottom of your ```<body>``` tag, but before you use any Firebase services.

5. Create function inside firebase_options_dev.dart  inside lib/main/enviroment that provides FirebaseOptions based on the current platform. For example, it can be implemented like this.

```dart
/// Global function that provides [FirebaseOptions] based on the platform.
FirebaseOptions firebaseOptions() {
  if (kIsWeb) {
    return const FirebaseOptions(
        /// Values from firebaseConfig from web/index.html.
        apiKey: 'api',
        authDomain: 'authDomain',
        projectId: 'projectId',
        storageBucket: 'storageBucket',
        messagingSenderId: 'messagingSenderId',
        appId: 'appId',
        measurementId: 'measurementId');
  }

  return switch (defaultTargetPlatform) {
    /// Values from android/app/google-services.json.
    TargetPlatform.android => const FirebaseOptions(
        apiKey: 'apiKey',
        appId: 'appId',
        messagingSenderId: 'messagingSenderId',
        projectId: 'projectId',
        storageBucket: 'storageBucket',
      ),
    /// Values from ios/Firebase/dev/GoogleService-Info.plist.
    TargetPlatform.iOS => const FirebaseOptions(
        apiKey: 'apiKey',
        appId: 'appId',
        messagingSenderId: 'messagingSenderId',
        projectId: 'projectId',
        storageBucket: 'storageBucket',
        iosBundleId: 'iosBundleId',
      ),
    _ => throw Exception('Not supported platform')
  };
}
```

6. Add this function call to ```firebaseOptions``` param of ```Environment.init```.

```dart
 /// Main entry point of app.
 void main() {
   Environment.init(
     buildType: BuildType.debug,
     config: AppConfig(
       url: Url.testUrl,
     ),
    firebaseOptions: firebaseOptions(),
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
