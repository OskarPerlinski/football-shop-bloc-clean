import 'package:dartz/dartz.dart';

abstract class CategoryReposiory {
  Future<Either> getCategories();
}