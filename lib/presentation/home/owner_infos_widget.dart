import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stars/domain/home/model/owner.dart';
import 'package:github_stars/resources/custom_colors.dart';

class OwnerInfosWidget extends StatelessWidget {
  OwnerInfosWidget({@required this.owner});

  final Owner owner;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: CustomColors.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(32))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/green_octocat.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nickname: ${formatText(owner.login)}'),
                    Text('Email: ${formatText(owner.email)}'),
                    Text('URL: ${formatText(owner.url)}'),
                    Text('Localização: ${formatText(owner.location)}'),
                    Text('Biografia: ${formatText(owner.bio)}')
                  ],
                ),
              ],
            ),
            MaterialButton(
              child: Text('Starred Repos'),
              onPressed: () {},
              textColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  String formatText(String text) {
    return text != null && text != '' ? text : '-';
  }
}
