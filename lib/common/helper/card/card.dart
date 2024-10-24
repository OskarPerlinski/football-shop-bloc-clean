import 'package:football_shop_app/domain/order/entity/product_ordered.dart';

class CartHelper {

  static double calculateCartTotalSubtotal(List<ProductOrderedEntity> products) {
    double subtotalPrice  = 0;
    for(var item in products) {
      subtotalPrice = subtotalPrice + item.totalPrice;
    }
    return subtotalPrice;

  }
}