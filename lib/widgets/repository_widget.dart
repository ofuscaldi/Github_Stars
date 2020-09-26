import 'package:flutter/material.dart';

class RepositoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        color: Colors.blue,
        height: 200,
        child: Column(
          children: [
            const Text('Repo Name'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: Text('Repo description')),
                Row(
                  children: const <Widget>[Icon(Icons.star_border), Text('1')],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
