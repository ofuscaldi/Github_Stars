import 'package:flutter/foundation.dart';
import 'package:github_stars/domain/home/contracts/home_repository.dart';
import 'package:github_stars/domain/home/model/owner.dart';
import 'package:github_stars/domain/result/result.dart';

class GetOwnerUseCase {
  GetOwnerUseCase(this._repository);

  final HomeRepository _repository;

  Future<Result<Owner>> execute({@required String owner}) {
    return _repository.getOwner(owner: owner).then((Owner owner) =>
        Result.success(data: owner)).catchError((dynamic error){
          return Result.error(exception: error);
    });
  }
}
