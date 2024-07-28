import 'package:dartz/dartz.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/models/dashboard.dart';
import 'package:gd/core/usecases/no_params.dart';
import 'package:gd/core/usecases/usecase.dart';
import 'package:gd/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class GetDashboardUsecase implements UseCase<Dashboard, NoParams> {
  final DashboardRepository _repository;
  GetDashboardUsecase(this._repository);

  @override
  Future<Either<Failure, Dashboard>> call(NoParams noParams) async {
    return await _repository.getDashboard();
  }
}
