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
         Text(repo.name ?? ''),
         Text(repo.description ?? ''),
         Text(repo.stars.toString() ?? '')
       ],
     ),);
  }
}
