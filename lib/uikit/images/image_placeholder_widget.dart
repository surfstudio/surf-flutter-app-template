import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/assets/resources.dart';

/// {@template image_placeholder_widget.class}
/// Placeholder for the time of uploading an image from the network.
/// {@endtemplate}
class ImagePlaceholderWidget extends StatelessWidget {
  /// {@macro image_placeholder_widget.class}
  const ImagePlaceholderWidget({super.key, this.assetName, this.size});

  /// The path to the svg icons.
  final String? assetName;

  /// Icon size.
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        assetName ?? SvgIcons.photoPlaceholder,
        width: size?.width,
        height: size?.height,
      ),
    );
  }
}
