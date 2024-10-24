import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_shop_app/common/bloc/button/button_state_cubit.dart';
import 'package:football_shop_app/common/widgets/appbar/basic_app_bar.dart';
import 'package:football_shop_app/domain/product/entity/product.dart';
import 'package:football_shop_app/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:football_shop_app/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:football_shop_app/presentation/product_detail/wigdets/add_to_cart.dart';
import 'package:football_shop_app/presentation/product_detail/wigdets/info.dart';
import 'package:football_shop_app/presentation/product_detail/wigdets/product_image.dart';
import 'package:football_shop_app/presentation/product_detail/wigdets/product_price.dart';
import 'package:football_shop_app/presentation/product_detail/wigdets/product_sizes.dart';
import 'package:football_shop_app/presentation/product_detail/wigdets/product_title.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductSizeSelectionCubit()),
        BlocProvider(create: (context) => ButtonStateCubit()),
        BlocProvider(create: (context) => ProductQuantityCubit()),
      ],
      child: Scaffold(
        appBar: const BasicAppbar(
          showLogo: true,
          transparentBackground: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                ProductImage(productEntity: productEntity),
                ProductTitle(productEntity: productEntity),
                const SizedBox(height: 20),
                ProductPrice(productEntity: productEntity),
                const SizedBox(height: 50),
                ProductSizes(productEntity: productEntity),
                const SizedBox(height: 50),
                 AddToCart(productEntity: productEntity,),
                const SizedBox(height: 30),
                const Info(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
