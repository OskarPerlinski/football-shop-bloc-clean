import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_shop_app/common/widgets/appbar/basic_app_bar.dart';
import 'package:football_shop_app/core/configs/assets/app_images.dart';
import 'package:football_shop_app/domain/order/entity/product_ordered.dart';
import 'package:football_shop_app/presentation/cart/bloc/cart_product_displat_state.dart';
import 'package:football_shop_app/presentation/cart/bloc/cart_product_display_cubit.dart';
import 'package:football_shop_app/presentation/cart/widgets/checkout.dart';
import 'package:football_shop_app/presentation/cart/widgets/product_ordered_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        showLogo: true,
        transparentBackground: false,
      ),
      body: BlocProvider(
        create: (context) => CartProductDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductDisplayCubit, CartProductDisplatState>(
          builder: (context, state) {
            if (state is CartProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartProductsLoaded) {
              return state.products.isEmpty
                  ? Center(
                      child: _cartIsEmpty(),
                    )
                  : Column(  // Use Column to manage space for ListView and Checkout button
                      children: [
                        Expanded(
                          child: _products(state.products),
                        ),
                        CheckOut(
                          products: state.products,
                        ),
                      ],
                    );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ProductOrderedCard(
            productOrdereEntity: products[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: products.length,
      ),
    );
  }

  Widget _cartIsEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.cart,
            height: 100,
          ),
          const Text(
            'Cart is empty',
            style: TextStyle(),
          )
        ],
      ),
    );
  }
}