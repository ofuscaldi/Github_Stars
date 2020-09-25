import 'package:github_stars/data/home/home_client.dart';
import 'package:github_stars/data/home/model/owner_api.dart';
import 'package:github_stars/domain/home/contracts/home_repository.dart';
import 'package:github_stars/domain/home/model/owner.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._client);

  HomeClient _client;

  @override
  Stream<Owner> getOwner() {
    return _client
        .getOwner()
        .map((OwnerApi ownerApi) => Owner.fromApi(ownerApi));
  }
}
