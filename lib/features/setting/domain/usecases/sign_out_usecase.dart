// import 'package:gd/core/error/failures.dart';
// import 'package:gd/core/usecases/no_params.dart';
// import 'package:gd/core/usecases/usecase.dart';
// import 'package:gd/features/setting/domain/repositories/setting_repository.dart';
// import 'package:injectable/injectable.dart';
// import 'package:dartz/dartz.dart';

// @lazySingleton
// class SignOutUsecase implements UseCase<void, NoParams> {
//   final SettingRepository _repository;
//   SignOutUsecase(this._repository);

//   @override
//   Future<Either<Failure, void>> call(NoParams params) async {
//     return await _repository.signOut();
//   }
// }
