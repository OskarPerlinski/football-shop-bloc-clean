import 'package:dartz/dartz.dart';
import 'package:football_shop_app/core/usecaces/uscecase.dart';
import 'package:football_shop_app/domain/product/repository/product.dart';
import 'package:football_shop_app/service_locator.dart';

class GetRecommendedUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().getRecommended();
  }
}
