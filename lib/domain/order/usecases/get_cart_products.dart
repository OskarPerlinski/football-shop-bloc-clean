import 'package:dartz/dartz.dart';
import 'package:football_shop_app/core/usecaces/uscecase.dart';
import 'package:football_shop_app/domain/order/repository/order.dart';
import 'package:football_shop_app/service_locator.dart';

class GetCartProductsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return sl<OrderRepository>().getCartProducts();
  }
  
}