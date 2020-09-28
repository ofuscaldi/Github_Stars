import 'dart:math';

import 'package:github_stars/domain/home/model/repository.dart';

List<Repository> get validRepository {
  final list = [
    Repository(
        name: 'repo1',
        description: 'repo1 description',
        stars: Random().nextInt(200)),
    Repository(
        name: 'repo2',
        description: 'repo2 description',
        stars: Random().nextInt(200))
  ];
  return list;
}
