import 'package:dartz/dartz.dart';
import 'package:gd/core/models/login.dart';
import 'package:gd/core/models/user.dart';
import '../../../../core/error/failures.dart';

abstract class LoginRepository {
  // Future<Either<Failure,User?>>getCurrentUserFirebase();
  Future<Either<Failure,User>>login({required Login loginData});
    Future<Either<Failure, User>> getProfile();
  // Future<Either<Failure,UserCredential>>signInWithGoogle();
  // Future<Either<Failure,void>>saveUserData({required String doc, required Map<String,dynamic>data});
}
