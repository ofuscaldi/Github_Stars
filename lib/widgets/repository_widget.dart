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
            Text('Repo Name'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text('Repo Name Text Size TestText Size TestText Size TestText Size TestText Size Test',)),
                Row(
                  children: [
                    Icon(Icons.star_border),
                    Text('1')
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
