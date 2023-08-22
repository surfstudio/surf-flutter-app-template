# Native splash screen

Creating native splash screen

## Image folder

The splash folder is located in the assets folder and has the following structure:

```text
- assets
    - splash
        - 1.5x
            - splash.png
            - splash_dark.png
        - 2.0x
            - splash.png
            - splash_dark.png
        - 3.0x
            - splash.png
            - splash_dark.png
        - 4.0x
            - splash.png
            - splash_dark.png
        splash.png
        splash_android12.png
        splash_dark.png
        splash_dark_android12.png
```

Additional folders with different image resolutions are created to properly prepare images for 
android versions 11 and below.
Focusing on https://docs.flutter.dev/ui/assets-and-images.

For versions 12 and above, the required file will be prepared from the images `splash_android12.png` 
and `splash_dark_android12.png` 

Designers should prepare basic files.

### Configuring image generation

The pubspec.yaml file contains the basic setup for the standard splash screen.

```text
flutter_native_splash:
  color: "#FFFFFF"
  image: assets/splash/4.0x/splash.png
  color_dark: "#000000"
  image_dark: assets/splash/4.0x/splash_dark.png
  android_12:
    color: "#FFFFFF"
    icon_background_color: "#FFFFFF"
    image: assets/splash/splash_android12.png
    color_dark: "#000000"
    icon_background_color_dark: "#000000"
    image_dark: assets/splash/splash_dark_android12.png
  android: true
  ios: true
  web: true
```

### Generation

To start the generation, run the command:
```shell
fvm flutter pub run flutter_native_splash:create
```

## Useful links

- [Instructions on how to configure additional parameters](https://pub.dev/packages/flutter_native_splash)
- [Splash screens Android 12](https://developer.android.com/develop/ui/views/launch/splash-screen)
