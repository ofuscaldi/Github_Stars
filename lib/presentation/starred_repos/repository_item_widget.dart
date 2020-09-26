import 'package:flutter/material.dart';
import 'package:github_stars/domain/home/model/repository.dart';

class RepositoryItemWidget extends StatelessWidget {
  const RepositoryItemWidget({@required this.repo});

  final Repository repo;

  @override
  Widget build(BuildContext context) {
    return Container(height: 100, width: 100, color: Colors.purple,
     child: Column(
       children: [
         Text('Name: $_formatText(repo.name)'),
         Text('Description: $_formatText(repo.description)'),
         Text(_formatText(repo.stars.toString()))
       ],
     ),);
  }

  String _formatText(String text) {
    return text != null && text != '' ? text : '-';
  }
}
