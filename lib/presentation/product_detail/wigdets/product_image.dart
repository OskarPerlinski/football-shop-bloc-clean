import 'package:flutter/material.dart';
import 'package:football_shop_app/common/helper/image/image_display_helper.dart';
import 'package:football_shop_app/domain/product/entity/product.dart';

class ProductImage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImage({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            ImageDisplayHelper.generateProductImageURL(productEntity.image),
          ),
        ),
      ),
    );
  }
}
