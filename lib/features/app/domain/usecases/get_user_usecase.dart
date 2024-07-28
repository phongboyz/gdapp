import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/app_repository.dart';

@lazySingleton
class GetUserUsecase implements UseCase<String, String> {
  final AppRepository _appRepository;

  GetUserUsecase(this._appRepository);

  @override
  Future<Either<Failure, String>> call(String params) async {
    return await _appRepository.getUser(doc: params);
  }
}
