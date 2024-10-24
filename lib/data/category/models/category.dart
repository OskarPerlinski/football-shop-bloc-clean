// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:football_shop_app/domain/category/entity/category.dart';

class CategoryModel {
  final String categoryId;
  final String title;

  CategoryModel({
    required this.categoryId,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'title': title,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['categoryId'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      title: title,
    );
  }
}
