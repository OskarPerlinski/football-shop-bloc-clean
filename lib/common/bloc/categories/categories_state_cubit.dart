import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_shop_app/common/bloc/categories/categories_state.dart';
import 'package:football_shop_app/domain/category/usecases/get_categories.dart';
import 'package:football_shop_app/service_locator.dart';

class CategoriesStateCubit extends Cubit<CategoriesState> {
  CategoriesStateCubit() : super(CategoriesLoading());

  void displayCategories() async {
    var returnedData = await sl<GetCategoriesUseCase>().call();
    returnedData.fold(
      (error){
        emit(
          LoadCategoriesFailure()
        );
      },
      (data){
        emit(
          CategoriesLoaded(categories: data)
        );
      },
    );
  }
}
