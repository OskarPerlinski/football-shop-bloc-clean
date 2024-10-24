import 'package:cloud_firestore/cloud_firestore.dart';

class ProductEntity {
  final String categoryId;
  final num discountedPrice;
  final Timestamp createdData;
  final num price;
  final String image;
  final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductEntity({
    required this.categoryId,
    required this.discountedPrice,
    required this.createdData,
    required this.price,
    required this.image,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title,
  });
}