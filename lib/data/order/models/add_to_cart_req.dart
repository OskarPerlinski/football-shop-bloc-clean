// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddToCartReq {
  final String productId;
  final String productTitle;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdData;

  AddToCartReq({
    required this.productId,
    required this.productTitle,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.createdData,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createdData': createdData,
    };
  }
}
