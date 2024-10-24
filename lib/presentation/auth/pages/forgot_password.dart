import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_shop_app/common/bloc/button/button_state.dart';
import 'package:football_shop_app/common/bloc/button/button_state_cubit.dart';
import 'package:football_shop_app/common/helper/navigator/app_navigator.dart';
import 'package:football_shop_app/common/widgets/appbar/basic_app_bar.dart';
import 'package:football_shop_app/common/widgets/button/basic_reactive_button.dart';
import 'package:football_shop_app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:football_shop_app/presentation/auth/pages/password_reset_email.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController _emailCon = TextEditingController();

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
              if (state is ButtonLoadedState) {
                AppNavigator.push(
                  context,
                  PasswordResetEmailPage(),
                );
              }
            },
            child: Column(
              children: [
                _forgotPasswordText(),
                const SizedBox(height: 50),
                _emailField(),
                const SizedBox(height: 10),
                _sendPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordText() {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: Text(
          'Reset Password',
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

  Widget _sendPassword() {
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
                    usecases: SendPasswordResetEmailUseCase(),
                    params: _emailCon.text,
                  );
            },
            title: 'Send Email',
          );
        },
      ),
    );
  }
}
