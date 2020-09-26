import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stars/domain/home/model/owner.dart';
import 'package:github_stars/resources/custom_colors.dart';
import 'package:transparent_image/transparent_image.dart';

class OwnerInfosWidget extends StatelessWidget {
  const OwnerInfosWidget({@required this.owner});

  final Owner owner;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: CustomColors.secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(32))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.secondaryColor,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/green_octocat.png'))),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: owner.avatarUrl ??
                          const AssetImage('assets/green_octocat.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nickname: ${formatText(owner.login)}'),
                      Text('Email: ${formatText(owner.email)}'),
                      Text('URL: ${formatText(owner.url)}'),
                      Text('Localização: ${formatText(owner.location)}'),
                      Text('Biografia: ${formatText(owner.bio)}')
                    ],
                  ),
                ),
              ],
            ),
            MaterialButton(
              child: const Text('Starred Repos'),
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
