import 'package:github_stars/data/home/model/owner_api.dart';

import 'mock_valid_repositories_list_api.dart';

OwnerApi get getValidOwnerApi {
  return OwnerApi(
      login: 'Frodo Baggins',
      email: 'frodo1800@zipmail.com.br',
      location: 'The Shire',
      starredRepos: getValidRepositoriesListApi,
      bio: 'I hate rings',
      avatarUrl: 'anyUrl',
      url: 'anyUrl'
  );
}