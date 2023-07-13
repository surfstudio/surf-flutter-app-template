# Icons launcher

To generate icons we use the flutter_launcher_icons package, as it generates adaptive icons.

The template contains basic icons. To replace them with yours, follow the recommendations.

## Image folder

In the root of the project in the assets folder we use the `assets` folder with the following structure:

``` text
launcher_icon
-- icon_background.png (If you don't want a gradient or textured background, you can remove this)
-- icon_background_dev.png
-- icon_foreground.png
-- icon_foreground_dev.png
-- icon_rectangle.png
-- icon_rectangle_dev.png
```

Basic files should be prepared by designers.

### Configuring image generation

flutter_launcher_icons-dev.yaml
flutter_launcher_icons-release.yaml

```text
flutter_launcher_icons:
  android: "ic_launcher"
  ios: true
  image_path_android: "assets/launcher_icon/icon_rectangle_dev.png"
  image_path_ios: "assets/launcher_icon/icon_rectangle_dev.png"
  min_sdk_android: 21 # android min sdk min:16, default 21
  adaptive_icon_background: "#FC3737"
  adaptive_icon_foreground: "assets/launcher_icon/icon_foreground_dev.png"
  remove_alpha_ios: true
  web:
    generate: false
    image_path: "assets/launcher_icon/icon_rectangle_dev.png"
    background_color: "#FC3737"
    theme_color: "#FC3737"
  windows:
    generate: false
    image_path: "assets/launcher_icon/icon_rectangle_dev.png"
    icon_size: 48 # min:48, max:256, default: 48
  macos:
    generate: false
    image_path: "assets/launcher_icon/icon_rectangle_dev.png"
```

## Useful links
- [Instructions on how to configure additional parameters](https://pub.dev/packages/flutter_launcher_icons)
- [UI Guide: Adaptive icons](https://developer.android.com/develop/ui/views/launch/icon_design_adaptive)

### Start generation

```shell
# Starts generating icons from all customization files
dart run flutter_launcher_icons
```