import 'package:flutter/material.dart';
import 'package:football_shop_app/common/helper/card/card.dart';
import 'package:football_shop_app/common/widgets/button/basic_app_button.dart';
import 'package:football_shop_app/domain/order/entity/product_ordered.dart';

class CheckOut extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const CheckOut({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              'Subtotal',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              '\$${CartHelper.calculateCartTotalSubtotal(products).toString()}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            )
          ]),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shiping Cost',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '\$8',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                )
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                '\$${CartHelper.calculateCartTotalSubtotal(products) + 8}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              )
            ],
          ),
          BasicAppButton(
            onPressed: () {},
            title: 'Checkout',
          )
        ],
      ),
    );
  }
}