import 'package:dartz/dartz.dart';
import 'package:football_shop_app/data/auth/models/user_creation_req.dart';
import 'package:football_shop_app/data/auth/models/user_signin_req.dart';

abstract class AuthRepository{

  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> sendPasswordResetEmail(String email);
}