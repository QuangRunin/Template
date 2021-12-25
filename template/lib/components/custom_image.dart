import 'package:flutter/widgets.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    this.imageRatio = 1.618,
    this.placeholder,
    this.image,
    required this.width,
  }) : super(key: key);
  final String? image;
  final double width;
  final double imageRatio;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    double? height = imageRatio == null ? width : imageRatio * width;
    return FadeInImage.assetNetwork(
      image: image!,
      placeholder: placeholder ?? 'assets/images/placeholder.jpg',
      width: width,
      height: height,
      fit: BoxFit.cover,
      fadeOutDuration: const Duration(milliseconds: 100),
      fadeInDuration: const Duration(milliseconds: 200),
    );
  }
}