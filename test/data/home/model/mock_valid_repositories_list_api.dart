import 'dart:math';

import 'package:github_stars/data/home/model/repository_api.dart';

List<RepositoryApi> get getValidRepositoriesListApi {
  final list = [
    RepositoryApi(
        name: 'repo1',
        description: 'repo1 description',
        stars: Random().nextInt(200)),
    RepositoryApi(
        name: 'repo2',
        description: 'repo2 description',
        stars: Random().nextInt(200))
  ];
  return list;
}