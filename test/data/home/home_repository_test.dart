import 'package:flutter_test/flutter_test.dart';
import 'package:github_stars/data/home/home_client.dart';
import 'package:github_stars/data/home/home_repository.dart';
import 'package:github_stars/domain/home/contracts/home_repository.dart';
import 'package:github_stars/domain/home/model/owner.dart';
import 'package:mockito/mockito.dart';
import '../../parameters.dart';
import 'model/mock_valid_owner_api.dart';

class _MockHomeClient extends Mock implements HomeClient {}

void main() {
  HomeClient _client;
  HomeRepository _repository;

  setUp(() {
    _client = _MockHomeClient();
    _repository = HomeRepositoryImpl(_client);
  });

  test('Client returns OwnerApi', () async {
    final ownerApi = getValidOwnerApi;
    when(_client.getOwner(owner: Parameters.owner))
        .thenAnswer((_) => Future.value(ownerApi));

    expect(await _repository.getOwner(owner: Parameters.owner),
        Owner.fromApi(ownerApi));
  });
}
