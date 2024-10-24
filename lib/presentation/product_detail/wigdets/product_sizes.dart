import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_shop_app/domain/product/entity/product.dart';
import 'package:football_shop_app/presentation/product_detail/bloc/product_size_selection_cubit.dart';

class ProductSizes extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductSizes({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tableOfSize(),
        const SizedBox(height: 20),
        _sizes(context),
      ],
    );
  }

  Widget _tableOfSize() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Choose Size',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Text(
            'Table of sizes',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _sizes(BuildContext context) {
    return  SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return BlocBuilder<ProductSizeSelectionCubit, int>(
                builder: (context, state) => GestureDetector(
                  onTap: () {
                    context
                        .read<ProductSizeSelectionCubit>()
                        .itemSelection(index);
                  },
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: state == index ? Colors.blue : Colors.white,
                      border: Border.all(
                        color:
                            state == index ? Colors.blue : Colors.black,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          productEntity.sizes[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: productEntity.sizes.length,
          ),
        ),
      );
  }
}
