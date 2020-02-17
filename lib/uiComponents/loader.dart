import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color color;

  Loader({this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(
          backgroundColor: color == null ? Colors.blueAccent : color,
        ),
      ),
    );
  }
}
