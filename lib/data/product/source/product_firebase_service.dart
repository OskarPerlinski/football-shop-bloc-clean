import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> getNewProducts();
  Future<Either> getRecommended();
  Future<Either> getProductByCategoryId(String categoryId);
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> getNewProducts() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where(
            'createdData',
            isGreaterThanOrEqualTo: Timestamp.fromDate(
              DateTime(2024, 10, 17),
            ),
          )
          .get();
      return Right(
        returnedData.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }

  @override
  Future<Either> getRecommended() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where(
            'salesNumber',
            isGreaterThanOrEqualTo: 100,
          )
          .get();
      return Right(
        returnedData.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return const Left(
        'Please try again',
      );
    }
  }
  
  @override
  Future<Either> getProductByCategoryId(String categoryId) async {
    try {
      var returnedData = await FirebaseFirestore.instance.collection('Products').where(
        'categoryId',
        isEqualTo: categoryId,
      ).get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left(
        'Please try again'
      );
    }
  }
}
