import 'package:bmi/widget/resultWidgets/circel_container.dart';
import 'package:bmi/widget/resultWidgets/small_container.dart';
import 'package:bmi/widget/resultWidgets/small_container_with_row_and_column.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.isMale,
    required this.result,
    required this.height,
    required this.weight,
    required this.age,
  }) : super(key: key);

  final bool isMale;
  final double result;
  final int height;
  final int weight;
  final int age;

  String get resultPhrase {
    String resultText = '';
    if (result >= 30) {
      resultText = 'سمين جدا';
    } else if (result >= 25 && result < 30) {
      resultText = 'وزنك زائد';
    } else if (result >= 18.5 && result < 25) {
      resultText = 'طبيعي';
    } else {
      resultText = 'نحيف';
    }
    return resultText;
  }

  String get maleCheck {
    String resultText = '';
    if (isMale) {
      resultText = "ذكر";
    } else {
      resultText = "أنثى";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "نتيجة فحصك",
          style: TextStyle(fontSize: 20, letterSpacing: 5),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SmallContainerWithColumnAndRow(
                    title: "الطول",
                    type: "سم ",
                    result: height,
                  ),
                  SmallConatiner(
                    result: maleCheck,
                  )
                ],
              ),
              CircleContainer(result: resultPhrase),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SmallContainerWithColumnAndRow(
                    title: "الوزن",
                    type: "كجم",
                    result: weight,
                  ),
                  SmallContainerWithColumnAndRow(
                    title: "العمر",
                    type: "سنة",
                    result: age,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
