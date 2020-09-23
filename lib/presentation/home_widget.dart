import 'package:flutter/material.dart';
import 'package:github_stars/widgets/default_app_bar.dart';
import 'package:github_stars/widgets/repository_widget.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(child: TextField()),
                FlatButton(
                  child: Text('Search'),
                  onPressed: null,
                )
              ],
            ),
          ),
          Column(
            children: [
              Image.asset(
                'assets/green_octocat.png',
                height: 150,
                width: 150,
              ),
              Column(
                children: [
                  Text('Name'),
                  Text('email'),
                  Text('URL'),
                  Text('Location'),
                  Text('Bio')
                ],
              ),
              MaterialButton(
                child: Text('Starred Repos'),
                onPressed: (){},
                textColor: Colors.blue,
              )
            ],
          )
        ],
      ),
    );
  }
}
