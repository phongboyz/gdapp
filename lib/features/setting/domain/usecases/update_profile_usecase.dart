import 'package:gd/core/error/failures.dart';
import 'package:gd/core/params/profile_param.dart';
import 'package:gd/core/usecases/usecase.dart';
import 'package:gd/features/setting/domain/repositories/setting_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@lazySingleton
class UpdateProfileUsecase implements UseCase<String, ProfileParams> {
  final SettingRepository _repository;
  UpdateProfileUsecase(this._repository);

  @override
  Future<Either<Failure, String>> call(ProfileParams params) async {
    return await _repository.updateProfile(profileParams: params);
  }
}
