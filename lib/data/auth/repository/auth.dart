import 'package:dartz/dartz.dart';
import 'package:football_shop_app/data/auth/models/user_creation_req.dart';
import 'package:football_shop_app/data/auth/models/user_signin_req.dart';
import 'package:football_shop_app/data/auth/source/auth_firebase_service.dart';
import 'package:football_shop_app/domain/auth/repository/auth.dart';
import 'package:football_shop_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return sl<AuthFirebaseService>().signup(user);
  }
  
  @override
  Future<Either> signin(UserSigninReq user) {
    return sl<AuthFirebaseService>().signin(user);
  }
  
  @override
  Future<Either> sendPasswordResetEmail(String email) {
    return sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

}