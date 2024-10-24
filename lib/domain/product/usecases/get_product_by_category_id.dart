import 'package:dartz/dartz.dart';
import 'package:football_shop_app/core/usecaces/uscecase.dart';
import 'package:football_shop_app/domain/product/repository/product.dart';
import 'package:football_shop_app/service_locator.dart';

class GetProductByCategoryIdUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<ProductRepository>().getProductByCategoryId(params!);
  }

}