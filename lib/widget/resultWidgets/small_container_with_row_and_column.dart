import 'package:bmi/style.dart';
import 'package:flutter/material.dart';

class SmallContainerWithColumnAndRow extends StatelessWidget {
  const SmallContainerWithColumnAndRow({
    Key? key,
    required this.title,
    required this.type,
    required this.result,
  }) : super(key: key);

  final String title;
  final String type;
  final int result;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 150,
      decoration: containerBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                type,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              Text(
                "$result",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
