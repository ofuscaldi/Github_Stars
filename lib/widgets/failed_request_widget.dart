import 'package:flutter/material.dart';

class FailedRequestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('Owner not found :(')),
    );
  }
}
