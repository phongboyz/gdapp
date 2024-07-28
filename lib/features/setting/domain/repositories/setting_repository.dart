import 'package:dartz/dartz.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/params/password_param.dart';
import 'package:gd/core/params/profile_param.dart';

abstract class SettingRepository {
  // Future<Either<Failure, void>> signOut();
  String? getLanguage();
  Future<Either<Failure, bool>> setLanguage({String? code});
  Future<Either<Failure, User>> getProfile();
  Future<Either<Failure, String>> changePassword({ required PasswordParams passwordParams});
  Future<Either<Failure, String>> updateProfile({ required ProfileParams profileParams});
}
