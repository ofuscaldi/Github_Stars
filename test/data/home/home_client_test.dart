import 'package:flutter_test/flutter_test.dart';
import 'package:github_stars/data/home/home_client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';

import '../../parameters.dart';
import 'model/mock_valid_owner_api.dart';

class _MockGraphQlClient extends Mock implements GraphQLClient {}

void main() {
  GraphQLClient _graphQlClient;
  HomeClient _client;

  setUp(() {
    _graphQlClient = _MockGraphQlClient();
    _client = HomeClient(_graphQlClient);
  });

  test('Fetch Owner works', () async {
    final ownerApi = getValidOwnerApi;
    when(_graphQlClient.query(any)).thenAnswer((_) => Future<QueryResult>.value(
            QueryResult(data: <String, Map<String, dynamic>>{
          'repositoryOwner': ownerApi.toJson(ownerApi)
        })));

    expect(await _client.getOwner(owner: Parameters.owner), ownerApi);
  });
}
