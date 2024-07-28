import 'package:dartz/dartz.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/usecases/no_params.dart';
import 'package:gd/core/usecases/usecase.dart';
import 'package:gd/features/login/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class GetProfileLoginUsecase implements UseCase<User, NoParams> {
  final LoginRepository _repository;
  GetProfileLoginUsecase(this._repository);

  @override
  Future<Either<Failure, User>> call(NoParams noParams) async {
    return await _repository.getProfile();
  }
}
