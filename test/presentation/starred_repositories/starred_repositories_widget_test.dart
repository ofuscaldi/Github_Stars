import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_stars/domain/home/model/repository.dart';
import 'package:github_stars/presentation/starred_repositories/repository_item_widget.dart';
import 'package:github_stars/presentation/starred_repositories/starred_repositories_widget.dart';

import '../../domain/model/mock_valid_repositories_list.dart';

void main() {
  Future<void> initializeWidget(WidgetTester tester, {List<Repository> arguments}) async {
    await tester.pumpWidget(MaterialApp(
        home: StarredRepositoriesWidget(arguments: arguments)));
    await tester.pump(Duration.zero);
  }

  testWidgets('Repositories shows properly', (WidgetTester tester) async {
    await initializeWidget(tester, arguments: getValidRepositoriesList);

    expect(find.byKey(StarredRepositoriesWidget.repositoriesListKey), findsOneWidget);
    expect(find.byKey(RepositoryItemWidget.repositoryNameKey), findsWidgets);
    expect(find.byKey(RepositoryItemWidget.repositoryDescriptionKey), findsWidgets);
    expect(find.byKey(RepositoryItemWidget.repositoryFavoritesCountKey), findsWidgets);
  });

  testWidgets('Show a empty view if the owner has no starred repos', (WidgetTester tester) async {
    await initializeWidget(tester, arguments: null);

    expect(find.byKey(StarredRepositoriesWidget.emptyListKey), findsOneWidget);
  });
}
