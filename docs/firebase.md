# Firebase

## Configuration

To use Firebase in your project, you need to do the following:

1. If you haven't already, install [Firebase CLI](https://firebase.google.com/docs/cli).
2. Log in to Firebase CLI with your Google account:
   ```sh
   firebase login
   ```
3. If you haven't already, activate the FlutterFire CLI plugin:
   ```sh
   dart pub global activate flutterfire_cli
   ```
4. Create project at [Firebase Console](https://console.firebase.google.com/).
5. Execute command to create a new project for certain flavor (e.g. dev flavor) in Firebase or select existing and specify supported platforms:
   ```sh
    flutterfire configure -p name_or_id_of_your_project -o lib/firebase_options_dev.dart --platforms android,ios -i your.ios.bundleId.dev -a your.android.package.name.dev
    ```

   params description:
    - `-p` - name or id of your Firebase project;
    - `-o` - path to file where Firebase options will be generated;
    - `--platforms` - platforms for which Firebase options will be generated;
    - `-i` - iOS bundle identifier;
    - `-a` - Android package name.

    As a result, you will get `firebase_options_dev.dart` file with Firebase options for dev flavor and created apps in Firebase project.

6. Move generated `firebase_app_id_file.json` to `ios/Firebase/{flavor_name}` folder - e.g. `ios/Firebase/dev/firebase_app_id_file.json`.
7. Pass generated `DefaultFirebaseOptions` to `Environment` in entry point of your app:
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

The `flutterfire configure` command will attempt to automatically configure your project to send readable crash reports to Crashlytics.

Unfortunately, there are cases that can result in the project not being fully configured.
[This guide](https://firebase.google.com/docs/crashlytics/get-deobfuscated-reports?platform=flutter) outlines what the automation does and provides first steps to debug your project setup.



