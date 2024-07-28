import 'package:dartz/dartz.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/usecases/no_params.dart';
import 'package:gd/core/usecases/usecase.dart';
import 'package:gd/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class GetCurrentUserDataUsecase implements UseCase<String, NoParams> {
  final HomeRepository _homeRepository;

  GetCurrentUserDataUsecase(this._homeRepository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await _homeRepository.signOut();
  }
}
