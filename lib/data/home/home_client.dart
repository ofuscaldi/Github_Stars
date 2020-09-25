import 'package:flutter/foundation.dart';
import 'package:github_stars/data/home/model/owner_api.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeClient {
  HomeClient(this._graphQLClient);

  GraphQLClient _graphQLClient;

  final String _getOwnerQuery = r''' query ($user:String!){
  repositoryOwner(login: $user) {
    ... on User {
      login
      avatarUrl
      bio
      location
      email
      url
      starredRepositories(first: 10) {
        nodes {
          name
          description
          stargazers {
            totalCount
          }
        }
      }
    }
  }
}''';

  Stream<OwnerApi> getOwner({@required String owner}) {
    print(owner);
    return _graphQLClient
        .query(QueryOptions(
            documentNode: gql(_getOwnerQuery),
            variables: <String, String>{'user': owner}))
        .asStream()
        .map((QueryResult result) {
          return OwnerApi.fromJson(result.data['repositoryOwner']);
    });
  }
}
