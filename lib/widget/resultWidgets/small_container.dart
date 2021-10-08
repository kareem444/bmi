import 'package:bmi/style.dart';
import 'package:flutter/material.dart';

class SmallConatiner extends StatelessWidget {
  const SmallConatiner({Key? key, required this.result}) : super(key: key);

  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 150,
      decoration: containerBoxDecoration,
      child: Center(
          child: Text(
        result,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 30,
        ),
      )),
    );
  }
}
