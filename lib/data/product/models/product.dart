// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:football_shop_app/domain/product/entity/product.dart';

class ProductModel {
  final String categoryId;
  final num discountedPrice;
  final Timestamp createdData;
  final num price;
  final String image;
  final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductModel({
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

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'] as String,
      discountedPrice: map['discountedPrice'] as num,
      createdData: map['createdData'] as Timestamp,
      price: map['price'] as num,
      image: map['image'] as String,
      sizes: List<String>.from(
        map['sizes'].map((e) => e.toString()),
      ),
      productId: map['productId'] as String,
      salesNumber: map['salesNumber'] as int,
      title: map['title'] as String,
    );
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      discountedPrice: discountedPrice,
      createdData: createdData,
      price: price,
      image: image,
      sizes: sizes,
      productId: productId,
      salesNumber: salesNumber,
      title: title,
    );
  }
}
