import 'package:bmi/style.dart';
import 'package:flutter/material.dart';

class HomeSmallContainerWithColumnAndRow extends StatelessWidget {
  const HomeSmallContainerWithColumnAndRow({
    Key? key,
    required this.title,
    this.icon,
    required this.result,
    this.active,
  }) : super(key: key);

  final String? title;
  final IconData? icon;
  final String result;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: active != null && active == true
          ? homeContainerBoxDecorationActive
          : homeContainerBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title != null
              ? Text(
                  "$title",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                )
              : Icon(
                  icon,
                  size: 50,
                ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 27,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
