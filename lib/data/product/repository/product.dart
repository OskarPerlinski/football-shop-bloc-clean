import 'package:dartz/dartz.dart';
import 'package:football_shop_app/data/product/models/product.dart';
import 'package:football_shop_app/data/product/source/product_firebase_service.dart';
import 'package:football_shop_app/domain/product/repository/product.dart';
import 'package:football_shop_app/service_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getNewProducts() async {
    var returnedData = await sl<ProductFirebaseService>().getNewProducts();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => ProductModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> getRecommended() async {
    var returnedData = await sl<ProductFirebaseService>().getRecommended();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map(
                (e) => ProductModel.fromMap(e).toEntity(),
              )
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> getProductByCategoryId(String categoryId) async {
    var returnedData =
        await sl<ProductFirebaseService>().getProductByCategoryId(categoryId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map(
                (e) => ProductModel.fromMap(e).toEntity(),
              )
              .toList(),
        );
      },
    );
  }
}
