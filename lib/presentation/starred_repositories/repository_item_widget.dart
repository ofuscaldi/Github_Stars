import 'package:flutter/material.dart';
import 'package:github_stars/domain/home/model/repository.dart';
import 'package:github_stars/resources/custom_colors.dart';
import 'package:github_stars/resources/text_style.dart';

class RepositoryItemWidget extends StatelessWidget {
  const RepositoryItemWidget({@required this.repo});

  static const repositoryNameKey = Key('Repository_Name_Key');
  static const repositoryDescriptionKey = Key('Repository_Description_Key');
  static const repositoryFavoritesCountKey = Key('Repository_Favorites_Count_Key');

  final Repository repo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: CustomColors.repositoryBackgroundColor,
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${_formatText(repo.name)}',
                        key: repositoryNameKey,
                        style: repositoryTitleStyle,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.star_border,
                          color: CustomColors.primaryColor,
                        ),
                        Text(
                          _formatText(repo.stars.toString()),
                          key: repositoryFavoritesCountKey,
                          style: const TextStyle(color: CustomColors.primaryColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text(
                '${_formatText(repo.description)}',
                key: repositoryDescriptionKey,
                style: repositoryDescriptionStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatText(String text) {
    return text != null && text != '' ? text : '-';
  }
}
