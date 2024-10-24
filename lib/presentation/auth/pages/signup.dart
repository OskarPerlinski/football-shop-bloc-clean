import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_shop_app/common/bloc/button/button_state.dart';
import 'package:football_shop_app/common/bloc/button/button_state_cubit.dart';
import 'package:football_shop_app/common/helper/navigator/app_navigator.dart';
import 'package:football_shop_app/common/widgets/appbar/basic_app_bar.dart';
import 'package:football_shop_app/common/widgets/button/basic_reactive_button.dart';
import 'package:football_shop_app/data/auth/models/user_creation_req.dart';
import 'package:football_shop_app/data/auth/models/user_signin_req.dart';
import 'package:football_shop_app/domain/auth/usecases/signup.dart';
import 'package:football_shop_app/presentation/auth/pages/signin.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _usernameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
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
            },
            child: Column(
              children: [
                _signupText(),
                const SizedBox(height: 50),
                _username(context),
                const SizedBox(height: 10),
                _emailField(context),
                const SizedBox(height: 10),
                _passwordField(context),
                const SizedBox(height: 20),
                _signupButton(),
                const SizedBox(height: 120),
                _signin(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signupText() {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: Text(
          'Create account',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _username(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: TextField(
        controller: _usernameCon,
        decoration: InputDecoration(
          hintText: 'Username',
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
            Icons.people_outline,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
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

  Widget _passwordField(BuildContext context) {
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

  Widget _signupButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Builder(
        builder: (context) {
          return BasicReactiveButton(
            onPressed: () {
              context.read<ButtonStateCubit>().execute(
                    usecases: SignupUseCase(),
                    params: UserCreationReq(
                      username: _usernameCon.text,
                      email: _emailCon.text,
                      password: _passwordCon.text,
                    ),
                  );
            },
            title: 'Sign up',
          );
        },
      ),
    );
  }

  Widget _signin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?  ',
        ),
        GestureDetector(
          onTap: () {
            AppNavigator.push(
              context,
              SigninPage(
                signinReq: UserSigninReq(
                  email: _emailCon.text,
                  password: _passwordCon.text,
                ),
              ),
            );
          },
          child: const Text(
            '  Sign in',
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
