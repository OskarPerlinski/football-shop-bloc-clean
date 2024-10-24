import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:football_shop_app/common/bloc/button/button_state.dart';
import 'package:football_shop_app/core/usecaces/uscecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required UseCase usecases}) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecases.call(params: params);

      returnedData.fold(
        (error) {
          emit(ButtonFailureState(errorMessage: error));
        },
        (data) {
          emit(ButtonLoadedState());
        },
      );
    } catch (e) {
      emit(
        ButtonFailureState(errorMessage: e.toString()),
      );
    }
  }
}
