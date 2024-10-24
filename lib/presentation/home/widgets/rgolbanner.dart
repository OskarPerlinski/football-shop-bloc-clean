import 'package:flutter/material.dart';
import 'package:football_shop_app/core/configs/assets/app_images.dart';

class Rgolbanner extends StatelessWidget {
  const Rgolbanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.baner,
    );
  }
}