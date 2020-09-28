import 'package:flutter/material.dart';

class FailedRequestWidget extends StatelessWidget {
  static const failedTextKey = Key('Failed_Text_Key');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
          child: Text(
        'Owner not found :(',
        key: failedTextKey,
      )),
    );
  }
}
