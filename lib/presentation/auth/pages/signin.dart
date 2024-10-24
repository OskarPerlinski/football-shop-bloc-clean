import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_shop_app/common/bloc/button/button_state.dart';
import 'package:football_shop_app/common/bloc/button/button_state_cubit.dart';
import 'package:football_shop_app/common/helper/navigator/app_navigator.dart';
import 'package:football_shop_app/common/widgets/appbar/basic_app_bar.dart';
import 'package:football_shop_app/common/widgets/button/basic_reactive_button.dart';
import 'package:football_shop_app/data/auth/models/user_signin_req.dart';
import 'package:football_shop_app/domain/auth/usecases/signin.dart';
import 'package:football_shop_app/presentation/auth/pages/forgot_password.dart';
import 'package:football_shop_app/presentation/auth/pages/signup.dart';
import 'package:football_shop_app/presentation/home/pages/home.dart';

class SigninPage extends StatelessWidget {
  final UserSigninReq signinReq;
  SigninPage({super.key, required this.signinReq});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: true,
        showLogo: false,
        transparentBackground: true,
        iconColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
              if (state is ButtonLoadedState) {
                AppNavigator.pushAndRemove(
                  context,
                  const HomePage(),
                );
              }
            },
            child: Column(
              children: [
                _signinText(),
                const SizedBox(height: 50),
                _emailField(),
                const SizedBox(height: 10),
                _passwordField(),
                const SizedBox(height: 20),
                _loginButton(),
                const SizedBox(height: 30),
                _forgotPassword(context),
                const SizedBox(height: 120),
                _signup(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: Text(
          'Sign in',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: TextField(
        controller: _emailCon,
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.purple.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: TextField(
        controller: _passwordCon,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.purple.withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(
            Icons.password,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Builder(
        builder: (context) {
          return BasicReactiveButton(
            onPressed: () {
              signinReq.email = _emailCon.text;
              signinReq.password = _passwordCon.text;
              context.read<ButtonStateCubit>().execute(
                    usecases: SigninUseCase(),
                    params: signinReq,
                  );
            },
            title: 'Login',
          );
        },
      ),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          AppNavigator.push(
            context,
            ForgotPasswordPage(),
          );
        },
        child: const Text(
          'Forgot password?',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _signup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont have an account?  ',
        ),
        GestureDetector(
          onTap: () {
            AppNavigator.push(
              context,
              SignupPage(),
            );
          },
          child: const Text(
            '  Sign up',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
