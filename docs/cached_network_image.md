### Downloading and caching images from the web

The CachedNetworkImage package is used to work with images from the network.

Example of use:
```dart
class ImageCustomWidget extends StatelessWidget {
  const ImageCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholderFadeInDuration: const Duration(milliseconds: 300),
      placeholder: (context, url) => _Skeleton(),
      errorWidget: (context, url, error) => _ErrorPlaceholder(),
    );
  }
}
```
When you want to have both the placeholder functionality and want to get the imageprovider to use in another
widget you can provide an imageBuilder:

```dart
class ImageCustomWidget extends StatelessWidget {
  const ImageCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
          ),
        ),
      ),
      placeholder: (context, url) => _Skeleton(),
      errorWidget: (context, url, error) => _ErrorPlaceholder(),
    );
  }
}
```

[Read more](https://pub.dev/packages/cached_network_image).
