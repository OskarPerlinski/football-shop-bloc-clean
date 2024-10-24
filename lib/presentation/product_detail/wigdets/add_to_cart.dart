import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_shop_app/common/bloc/button/button_state.dart';
import 'package:football_shop_app/common/bloc/button/button_state_cubit.dart';
import 'package:football_shop_app/common/helper/navigator/app_navigator.dart';
import 'package:football_shop_app/common/helper/product/product_price.dart';
import 'package:football_shop_app/common/widgets/button/basic_reactive_button.dart';
import 'package:football_shop_app/data/order/models/add_to_cart_req.dart';
import 'package:football_shop_app/domain/order/usecases/add_to_cart.dart';
import 'package:football_shop_app/domain/product/entity/product.dart';
import 'package:football_shop_app/presentation/cart/pages/cart.dart';
import 'package:football_shop_app/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:football_shop_app/presentation/product_detail/bloc/product_size_selection_cubit.dart';

class AddToCart extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToCart({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonLoadedState) {
          AppNavigator.push(
            context,
            const CartPage(),
          );
        }
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                  usecases: AddToCartUseCase(),
                  params: AddToCartReq(
                    productId: productEntity.productId,
                    productTitle: productEntity.title,
                    productSize: productEntity
                        .sizes[context.read<ProductSizeSelectionCubit>().state],
                    productPrice: productEntity.price.toDouble(),
                    totalPrice:
                        ProductPriceHelper.provideCurrentPrice(productEntity) *
                            context.read<ProductQuantityCubit>().state,
                    productImage: productEntity.image,
                    createdData: DateTime.now().toString(),
                  ),
                );
          },
          title: 'Add to cart',
        ),
      ),
    );
  }
}
