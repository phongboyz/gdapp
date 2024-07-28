// import 'package:dartz/dartz.dart';


import 'package:dartz/dartz.dart';
import 'package:gd/core/error/failures.dart';

abstract class HomeRepository{
  Future<Either<Failure,String>>signOut();
  // Future<Either<Failure,Users>>getCurrentUser();
}