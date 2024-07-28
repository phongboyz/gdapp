import 'package:dartz/dartz.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/models/login.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/usecases/usecase.dart';
import 'package:gd/features/login/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetLoginUsecase implements UseCase<User, Login> {
  final LoginRepository _loginRepository;

  GetLoginUsecase(this._loginRepository);

  @override
  Future<Either<Failure, User>> call(Login loginData) async {
    return await _loginRepository.login(loginData: loginData);
  }
}
