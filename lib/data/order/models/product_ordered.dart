// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:football_shop_app/domain/order/entity/product_ordered.dart';

class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdData;
  final String id;

  ProductOrderedModel({
    required this.productId,
    required this.productTitle,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.createdData,
    required this.id,
  });


  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productSize: map['productSize'] as String,
      productPrice: map['productPrice'] as double,
      totalPrice: map['totalPrice'] as double,
      productImage: map['productImage'] as String,
      createdData: map['createdData'] as String,
      id: map['id'] as String,
    );
  }


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createdDate': createdData,
      'id' : id,
    };
  }

}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
      productId: productId, 
      productTitle: productTitle, 
      productSize: productSize, 
      productPrice: productPrice, 
      totalPrice: totalPrice, 
      productImage: productImage, 
      createdData: createdData,
      id: id,
    );
  }
}

extension ProductOrderedXEntity on ProductOrderedEntity {
  ProductOrderedModel fromEntity() {
    return ProductOrderedModel(
      productId: productId, 
      productTitle: productTitle, 
      productSize: productSize, 
      productPrice: productPrice, 
      totalPrice: totalPrice, 
      productImage: productImage, 
      createdData: createdData,
      id: id,
    );
  }
}