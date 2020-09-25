import 'package:graphql_flutter/graphql_flutter.dart';

HttpLink _provideHttpLink() {
  final httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );
  return httpLink;
}

AuthLink _provideAuthLink() {
  const _BEARER_TOKEN =
      'a7028abfd0bc8b6e20ec30661b3a415e29d10308'; //Personal token '-'
  final authLink = AuthLink(getToken: () async => 'Bearer $_BEARER_TOKEN');
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