import 'package:dartz/dartz.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/models/member.dart';
import 'package:gd/core/usecases/usecase.dart';
import 'package:gd/features/sale/domain/repository/sale_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMemberListUsecase implements UseCase<Member, String> {
  final SaleRepository _repository;
  GetMemberListUsecase(this._repository);

  @override
  Future<Either<Failure, Member>> call(String data) async {
    return await _repository.getMember(memberData: data);
  }
}
