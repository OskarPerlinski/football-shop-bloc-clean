import 'package:flutter/material.dart';
import 'package:football_shop_app/common/helper/navigator/app_navigator.dart';
import 'package:football_shop_app/core/configs/assets/app_images.dart';
import 'package:football_shop_app/presentation/cart/pages/cart.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 100,
      width: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _menu(),
            _appLogo(),
            _cartIcon(context),
          ],
        ),
      ),
    );
  }

  Widget _menu() {
    return const Icon(
      Icons.menu,
      color: Colors.white,
    );
  }

  Widget _appLogo() {
    return Image.asset(
      AppImages.appLogo,
    );
  }

  Widget _cartIcon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
          context,
          const CartPage(),
        );
      },
      child: const Icon(
        Icons.shopping_bag_outlined,
        color: Colors.white,
      ),
    );
  }
}
