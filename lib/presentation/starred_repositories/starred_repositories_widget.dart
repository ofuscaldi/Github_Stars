import 'package:flutter/material.dart';
import 'package:github_stars/domain/home/model/repository.dart';
import 'package:github_stars/presentation/starred_repositories/repository_item_widget.dart';
import 'package:github_stars/resources/custom_colors.dart';
import 'package:github_stars/widgets/default_app_bar.dart';

class StarredRepositoriesWidget extends StatelessWidget {
  const StarredRepositoriesWidget({this.arguments});

  final List<Repository> arguments;

  static const repositoriesListKey = Key('Repositories_List_Key');
  static const emptyListKey = Key('Empty_List_Key');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: 'Starred Repositories'),
      backgroundColor: CustomColors.primaryColor,
      body: arguments != null
          ? ListView(
              key: repositoriesListKey,
              children: _buildReposList(),
            )
          : Container(
              key: emptyListKey,
              child: const Center(
                  child: Text(
                'This user has no starred repositories',
                style: TextStyle(color: CustomColors.secondaryColor),
              )),
            ),
    );
  }

  List<Widget> _buildReposList() {
    return arguments.map((repo) => RepositoryItemWidget(repo: repo)).toList();
  }
}

class StarredRepositoriesArguments {
  StarredRepositoriesArguments(this.owner);

  final List<Repository> owner;
}
