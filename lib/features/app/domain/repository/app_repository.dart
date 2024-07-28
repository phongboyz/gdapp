

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class AppRepository {
  // Future<Either<Failure,User?>>getCurrentUserFirebase();
  Future<Either<Failure,String>>getUser({required String doc});
  // Future<Either<Failure,UserCredential>>signInWithGoogle();
  // Future<Either<Failure,void>>saveUserData({required String doc, required Map<String,dynamic>data});
}
