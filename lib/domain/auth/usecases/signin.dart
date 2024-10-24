import 'package:dartz/dartz.dart';
import 'package:football_shop_app/core/usecaces/uscecase.dart';
import 'package:football_shop_app/data/auth/models/user_signin_req.dart';
import 'package:football_shop_app/domain/auth/repository/auth.dart';
import 'package:football_shop_app/service_locator.dart';

class SigninUseCase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq ? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }

}