import 'package:flutter/material.dart';
import 'package:football_shop_app/core/configs/assets/app_images.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? action;
  final bool transparentBackground;
  final bool hideBack;
  final bool showLogo;
  final double? height;
  final Color? iconColor;
  const BasicAppbar({
    this.hideBack = false,
    this.action,
    this.height,
    super.key,
    required this.showLogo,
    required this.transparentBackground,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          transparentBackground ? Colors.transparent : Colors.black,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 80,
      title: showLogo
          ? Image.asset(
              AppImages.appLogo,
              height: 90,
            )
          : null,
      actions: [
        action ?? Container(),
      ],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: iconColor ?? Colors.white,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}
