import 'package:flutter/foundation.dart';
import 'package:github_stars/data/home/home_client.dart';
import 'package:github_stars/domain/home/contracts/home_repository.dart';
import 'package:github_stars/domain/home/model/owner.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._client);

  final HomeClient _client;

  @override
  Future<Owner> getOwner({@required String owner}) async {
    final ownerApi = await _client.getOwner(owner: owner);
    return Owner.fromApi(ownerApi);
  }
}
