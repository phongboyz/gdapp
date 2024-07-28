import 'package:gd/core/error/failures.dart';
import 'package:gd/core/params/password_param.dart';
import 'package:gd/core/usecases/usecase.dart';
import 'package:gd/features/setting/domain/repositories/setting_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@lazySingleton
class ChangePasswordUsecase implements UseCase<String, PasswordParams> {
  final SettingRepository _repository;
  ChangePasswordUsecase(this._repository);

  @override
  Future<Either<Failure, String>> call(PasswordParams params) async {
    return await _repository.changePassword(passwordParams: params);
  }
}
