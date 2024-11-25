import 'package:flutter/material.dart';

class ImageBack extends StatelessWidget {
  final String image;
  final Widget child;

  const ImageBack({
    super.key,
    required this.child,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: child,
        ),
      ],
    );
  }
}
