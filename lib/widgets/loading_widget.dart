import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {

  static const circularProgressIndicatorKey = Key('Circular_Progress_Indicator_Key');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CircularProgressIndicator(
          key: circularProgressIndicatorKey,
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
