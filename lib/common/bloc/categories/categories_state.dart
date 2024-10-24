import 'package:football_shop_app/domain/category/entity/category.dart';

abstract class CategoriesState {}

class CategoriesLoading extends CategoriesState{}

class CategoriesLoaded extends CategoriesState{
  final List<CategoryEntity> categories;
  CategoriesLoaded({required this.categories});
}

class LoadCategoriesFailure extends CategoriesState{}