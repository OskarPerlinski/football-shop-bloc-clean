import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_shop_app/common/helper/navigator/app_navigator.dart';
import 'package:football_shop_app/common/widgets/appbar/basic_app_bar.dart';
import 'package:football_shop_app/common/widgets/button/basic_app_button.dart';
import 'package:football_shop_app/core/configs/assets/app_vectors.dart';
import 'package:football_shop_app/data/auth/models/user_signin_req.dart';
import 'package:football_shop_app/presentation/auth/pages/signin.dart';

class PasswordResetEmailPage extends StatelessWidget {
  PasswordResetEmailPage({super.key});

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
        child: Column(
          children: [
            _textEmailSend(),
            const SizedBox(height: 10),
            _logoEmailSend(),
            const SizedBox(height: 350),
            _returnLogin(context),
          ],
        ),
      ),
    );
  }

  Widget _textEmailSend() {
    return const Center(
      child: Text(
        'We sent you reset password Email.',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _logoEmailSend() {
    return SvgPicture.asset(
      AppVectors.emailSend,
      height: 100,
    );
  }

  Widget _returnLogin(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.pushAndRemove(
          context,
          SigninPage(
            signinReq: UserSigninReq(
              email: _emailCon.text,
              password: _passwordCon.text,
            ),
          ),
        );
      },
      width: 200,
      title: 'Return to Login',
    );
  }
}
