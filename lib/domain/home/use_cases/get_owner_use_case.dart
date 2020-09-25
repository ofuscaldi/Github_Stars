import 'package:flutter/foundation.dart';
import 'package:github_stars/domain/home/contracts/home_repository.dart';
import 'package:github_stars/domain/home/model/owner.dart';
import 'package:github_stars/domain/result/result.dart';

class GetOwnerUseCase {
  GetOwnerUseCase(this._repository);

  HomeRepository _repository;

  Stream<Result<Owner>> execute({@required String owner}) {
    print(owner);
    return _repository.getOwner(owner: owner).map((Owner owner) =>
        owner != null ? Result.success(data: owner) : Result.error());
  }
}
