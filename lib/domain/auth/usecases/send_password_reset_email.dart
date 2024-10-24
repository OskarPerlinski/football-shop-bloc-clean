import 'package:dartz/dartz.dart';
import 'package:football_shop_app/core/usecaces/uscecase.dart';
import 'package:football_shop_app/domain/auth/repository/auth.dart';
import 'package:football_shop_app/service_locator.dart';

class SendPasswordResetEmailUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return sl<AuthRepository>().sendPasswordResetEmail(params!);
  }
  
}