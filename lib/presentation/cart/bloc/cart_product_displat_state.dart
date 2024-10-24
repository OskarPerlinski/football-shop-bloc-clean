import 'package:football_shop_app/domain/order/entity/product_ordered.dart';

abstract class CartProductDisplatState {}

class CartProductsLoading extends CartProductDisplatState{}

class CartProductsLoaded extends CartProductDisplatState{
  final List<ProductOrderedEntity> products;
  CartProductsLoaded({required this.products});
}

class LoadProductsFailure extends CartProductDisplatState{}
