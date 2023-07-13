# Icons launcher

To generate icons we use the icons_launcher package, as it generates adaptive icons.

The template contains basic icons. To replace them with yours, follow the recommendations.

## Image folder

In the root of the project in the assets folder we use the `assets` folder with the following structure:

``` text
launcher_icon
-- icon_background.png
-- icon_background_dev.png
-- icon_border.png
-- icon_border_dev.png
-- icon_foreground.png
-- icon_foreground_dev.png
-- icon_monochrome.png
-- icon_monochrome_dev.png
-- icon_rectangle.png
-- icon_rectangle_dev.png
-- icon_round.png
-- icon_round_dev.png
```

Basic files should be prepared by designers.

### Configuring image generation

icons_launcher-dev.yaml
icons_launcher-release.yaml

```text
icons_launcher:
  image_path: "assets/launcher_icon/icon_border_dev.png"
  platforms:
    android:
      enable: true
      image_path: "assets/launcher_icon/icon_border_dev.png"
      adaptive_background_image: "assets/launcher_icon/icon_background_dev.png"
      adaptive_foreground_image: "assets/launcher_icon/icon_foreground_dev.png"
      adaptive_round_image: "assets/launcher_icon/icon_round_dev.png"
      adaptive_monochrome_image: "assets/launcher_icon/icon_monochrome_dev.png"
    ios:
      enable: true
      image_path: "assets/launcher_icon/icon_rectangle_dev.png"
    web:
      enable: false
      image_path: "assets/launcher_icon/icon_border_dev.png"
      favicon_path: "assets/launcher_icon/icon_dev_round_dev.png"
    macos:
      enable: false
      image_path: "assets/launcher_icon/icon_border_dev.png"
    windows:
      enable: false
      image_path: "assets/launcher_icon/icon_border_dev.png"
    linux:
      enable: false
      image_path: "assets/launcher_icon/icon_border_dev.png"
```

## Useful links
- [Instructions on how to configure additional parameters](https://pub.dev/packages/icons_launcher)
- [UI Guide: Adaptive icons](https://developer.android.com/develop/ui/views/launch/icon_design_adaptive)

### Start generation

```shell
# Add the files to android/app/src/main/res
dart run icons_launcher:create --path icons_launcher-dev.yaml

# Add the files to android/app/src/dev/res
dart run icons_launcher:create --flavor dev

# Add the files to android/app/src/release/res
dart run icons_launcher:create --flavor release
```