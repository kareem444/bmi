import 'package:bmi/style.dart';
import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({Key? key, required this.result}) : super(key: key);

  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        width: 210,
        decoration: containerBoxDecorationForCircle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "الصحة العامة",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Text(
                result,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
