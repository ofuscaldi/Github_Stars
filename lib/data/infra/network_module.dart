import 'package:graphql_flutter/graphql_flutter.dart';

const String authToken = 'edf0db0d41c7bd29ef9';

HttpLink _provideHttpLink() {
  final httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );
  return httpLink;
}

AuthLink _provideAuthLink() {
  final authLink = AuthLink(getToken: () async => 'Bearer fbd583d4482c15afcd410$authToken');
  return authLink;
}

Link _provideLink() {
  final link = _provideAuthLink().concat(_provideHttpLink());
  return link;
}

String uuidFromObject(Object object) {
  if (object is Map<String, Object>) {
    final typeName = object['__typename'];
    final id = object['id'].toString();
    if (typeName != null && id != null) {
      return <Object>[typeName, id].join('/');
    }
  }
  return null;
}

OptimisticCache get cache => OptimisticCache(
  dataIdFromObject: uuidFromObject,
);

GraphQLClient provideGraphQLClient() {
  return GraphQLClient(
    cache: cache,
    link: _provideLink(),
  );
}