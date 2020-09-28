import 'package:github_stars/domain/home/model/owner.dart';

import 'mock_valid_repositories_list.dart';

Owner get getValidOwner {
  return Owner(
      login: 'Frodo Baggins',
      email: 'frodo1800@zipmail.com.br',
      location: 'The Shire',
      starredRepos: getValidRepositoriesList,
      bio: 'I hate rings',
      avatarUrl: 'anyUrl',
      url: 'anyUrl');
}
