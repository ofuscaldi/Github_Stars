import 'package:flutter/material.dart';
import 'package:github_stars/domain/home/model/repository.dart';
import 'package:github_stars/presentation/starred_repos/repository_item_widget.dart';
import 'package:github_stars/widgets/default_app_bar.dart';

class StarredRepositoriesWidget extends StatelessWidget {
  const StarredRepositoriesWidget({this.arguments});

  final List<Repository> arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: 'Starred Repositories'),
      body: ListView(
        children: _buildReposList(),
      ),
    );
  }

  List<Widget> _buildReposList() {
    return arguments
        .map((repo) => RepositoryItemWidget(repo: repo)).toList();
  }
}

class StarredRepositoriesArguments {
  StarredRepositoriesArguments(this.owner);

  final List<Repository> owner;
}
