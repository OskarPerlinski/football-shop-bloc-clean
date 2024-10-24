import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_shop_app/common/bloc/products/product_state.dart';
import 'package:football_shop_app/core/usecaces/uscecase.dart';


class ProductsCubit extends Cubit<ProductsState> {
  final UseCase useCase;
  ProductsCubit({required this.useCase}) : super(ProductsInitialState());
  
  void displayProducts({dynamic params}) async {
    emit(
      ProductsLoading()
    );
    var returnedData = await useCase.call(
      params: params
    );
    returnedData.fold(
      (error) {
        emit(
          LoadProductsFailure()
        );
      },
      (data) {
        emit(
          ProductsLoaded(products: data)
        );
      }
    );
  }

  void displayInitial() {
    emit(
      ProductsInitialState()
    );
  }

}