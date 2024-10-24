import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_shop_app/core/configs/assets/app_images.dart';
import 'package:football_shop_app/data/auth/models/user_signin_req.dart';
import 'package:football_shop_app/presentation/auth/pages/signin.dart';
import 'package:football_shop_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:football_shop_app/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SigninPage(
                signinReq: UserSigninReq(
                  email: _emailCon.text,
                  password: _passwordCon.text,
                ),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Image.asset(AppImages.appLogo),
        ),
      ),
    );
  }
}
