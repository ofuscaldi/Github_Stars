import 'package:flutter/material.dart';
import 'package:github_stars/domain/home/model/owner.dart';
import 'package:github_stars/presentation/starred_repositories/starred_repositories_widget.dart';

class HomeNavigator{
  Future<void> openStarredRepositories(BuildContext context,
      {@required Owner owner}) async {

    await Navigator.push(
        context,
        MaterialPageRoute<bool>(
            builder: (BuildContext context) => StarredRepositoriesWidget(arguments: owner.starredRepos,)));
  }
}