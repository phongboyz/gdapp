import 'package:dartz/dartz.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

import '../repositories/setting_repository.dart';

@lazySingleton
class SetLanguageUsecase implements UseCase<bool, String?> {
  final SettingRepository _repository;

  SetLanguageUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(String? params)async {
   return await _repository.setLanguage(code: params);
  }
}
