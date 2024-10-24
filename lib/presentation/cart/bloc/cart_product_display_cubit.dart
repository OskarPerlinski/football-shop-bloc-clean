import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_shop_app/domain/order/entity/product_ordered.dart';
import 'package:football_shop_app/domain/order/usecases/get_cart_products.dart';
import 'package:football_shop_app/domain/order/usecases/remove_cart_product.dart';
import 'package:football_shop_app/presentation/cart/bloc/cart_product_displat_state.dart';
import 'package:football_shop_app/service_locator.dart';

class CartProductDisplayCubit extends Cubit<CartProductDisplatState> {
  CartProductDisplayCubit() : super(CartProductsLoading());

  void displayCartProducts() async {
    var returnedData = await sl<GetCartProductsUseCase>().call();
    returnedData.fold(
      (error) {
        emit(LoadProductsFailure());
      },
      (data) {
        emit(CartProductsLoaded(products: data));
      },
    );
  }

  void removeProduct(ProductOrderedEntity product) async {
    emit(CartProductsLoading());
    var returnedData = await sl<RemoveCartProductUseCase>().call(
      params: product.id,
    );
    returnedData.fold(
      (error) {
        emit(
          LoadProductsFailure(),
        );
      },
      (data) {
        displayCartProducts();
      },
    );
  }
}
