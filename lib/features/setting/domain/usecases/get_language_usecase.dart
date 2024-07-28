import 'package:gd/core/usecases/no_params.dart';
import 'package:gd/core/usecases/usecase_sync.dart';
import 'package:injectable/injectable.dart';

import '../repositories/setting_repository.dart';

@lazySingleton
class GetLanguageUsecase implements SynchronousUseCase<String?, NoParams> {
  final SettingRepository _repository;

  GetLanguageUsecase(this._repository);
  @override
  String? call(NoParams params) {
    return _repository.getLanguage();
  }
}
