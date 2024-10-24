import 'package:dartz/dartz.dart';
import 'package:football_shop_app/core/usecaces/uscecase.dart';
import 'package:football_shop_app/data/order/models/add_to_cart_req.dart';
import 'package:football_shop_app/domain/order/repository/order.dart';
import 'package:football_shop_app/service_locator.dart';

class AddToCartUseCase implements UseCase<Either, AddToCartReq> {
  @override
  Future<Either> call({AddToCartReq? params}) async {
    return sl<OrderRepository>().addToCart(params!);
  }
}
