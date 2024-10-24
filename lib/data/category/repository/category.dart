import 'package:dartz/dartz.dart';
import 'package:football_shop_app/data/category/models/category.dart';
import 'package:football_shop_app/data/category/source/category_firebase_service.dart';
import 'package:football_shop_app/domain/category/repository/category.dart';
import 'package:football_shop_app/service_locator.dart';

class CategoryReposioryImpl extends CategoryReposiory {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseService>().getCategories();
    return categories.fold(
      (error){
        return Left(error);
      },
      (data){
        return Right(
          List.from(data).map((e) => CategoryModel.fromMap(e).toEntity()).toList()
        );
      },
    );
  }
}
