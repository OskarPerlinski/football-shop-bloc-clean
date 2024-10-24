import 'package:bloc/bloc.dart';
import 'package:football_shop_app/presentation/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(
      const Duration(
        seconds: 4,
      ),
    );
    emit(
      UnAuthenticated(),
    );
  }
}
