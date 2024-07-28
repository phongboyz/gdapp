import 'package:dartz/dartz.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/usecases/no_params.dart';
import 'package:gd/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

import '../repositories/setting_repository.dart';

@lazySingleton
class GetProfileUsecase implements UseCase<User, NoParams> {
  final SettingRepository _repository;
  GetProfileUsecase(this._repository);

  @override
  Future<Either<Failure, User>> call(NoParams noParams) async {
    return await _repository.getProfile();
  }
}
