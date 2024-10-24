import 'package:dartz/dartz.dart';
import 'package:football_shop_app/core/usecaces/uscecase.dart';
import 'package:football_shop_app/data/auth/models/user_creation_req.dart';
import 'package:football_shop_app/domain/auth/repository/auth.dart';
import 'package:football_shop_app/service_locator.dart';

class SignupUseCase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq ? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }

}