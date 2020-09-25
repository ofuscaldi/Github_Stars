import 'package:flutter/foundation.dart';
import 'package:github_stars/data/home/home_client.dart';
import 'package:github_stars/data/home/model/owner_api.dart';
import 'package:github_stars/domain/home/contracts/home_repository.dart';
import 'package:github_stars/domain/home/model/owner.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._client);

  HomeClient _client;

  @override
  Stream<Owner> getOwner({@required String owner}) {
    print(owner);
    return _client
        .getOwner(owner: owner)
        .map((OwnerApi ownerApi) => Owner.fromApi(ownerApi));
  }
}
