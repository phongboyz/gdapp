import 'package:dartz/dartz.dart';
import 'package:gd/core/models/dashboard.dart';
import '../../../../core/error/failures.dart';

abstract class DashboardRepository {
    Future<Either<Failure, Dashboard>> getDashboard();
}
