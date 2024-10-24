import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either> getNewProducts(); 
  Future<Either> getRecommended();
  Future<Either> getProductByCategoryId(String categoryId);
}