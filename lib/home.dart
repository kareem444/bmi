import 'dart:math';
import 'package:bmi/result.dart';
import 'package:bmi/style.dart';
import 'package:bmi/widget/homeWidgets/home_small_container_with_row_and_column.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isMale = true;
  double height = 170;
  int weight = 70;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.medical_services_rounded),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                  child: Text(
                    'إفحص صحتك',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 13,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        genderExpanded("male", isMale),
                        genderExpanded("female", !isMale),
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: homeContainerBoxDecoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "الطول",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white70),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 62,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toStringAsFixed(0),
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow.withOpacity(.88)),
                                ),
                                const SizedBox(
                                  width: 4.2,
                                ),
                                const Text(
                                  "cm",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white70),
                                )
                              ],
                            ),
                            Slider(
                              value: height,
                              onChanged: (val) {
                                setState(() {
                                  height = val;
                                });
                              },
                              min: 15,
                              max: 200,
                            )
                          ],
                        )),
                    Row(
                      children: [
                        iconExpanded("weight"),
                        iconExpanded("age"),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.teal,
                        ),
                        onPressed: () {
                          var finalResult = weight / pow(height / 100, 2);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Result(
                                        isMale: isMale,
                                        result: finalResult,
                                        height: height.toInt(),
                                        weight: weight,
                                        age: age,
                                      )));
                        },
                        child: const Text(
                          "تنفيذ",
                          style: TextStyle(fontSize: 25),
                        )),
                  ))
            ],
          ),
        ));
  }

  Expanded genderExpanded(String type, bool male) {
    String gender = "ذكر";
    IconData genderIcon = Icons.male;

    if (type == "male") {
      gender = "ذكر";
      genderIcon = Icons.male;
    } else {
      gender = "أنثى";
      genderIcon = Icons.female;
    }

    return Expanded(
        child: Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => isMale = type == "male" ? true : false),
          child: HomeSmallContainerWithColumnAndRow(
            result: gender,
            icon: genderIcon,
            title: null,
            active: male,
          ),
        ),
      ],
    ));
  }

  Expanded iconExpanded(
    String type,
  ) {
    String title = "الوزن";
    int result = 70;

    if (type == "weight") {
      title = "الوزن";
      result = weight;
    } else {
      title = "العمر";
      result = age;
    }

    return Expanded(
        child: Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: homeContainerBoxDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "$result",
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 33,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          if (title == "الوزن") {
                            if (weight > 3) {
                              setState(() {
                                weight--;
                              });
                            }
                          } else {
                            if (age > 1) {
                              setState(() {
                                age--;
                              });
                            }
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.teal),
                          child: const Center(
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (title == "الوزن") {
                            if (weight < 299) {
                              setState(() {
                                weight++;
                              });
                            }
                          } else {
                            if (age < 130) {
                              setState(() {
                                age++;
                              });
                            }
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.teal),
                          child: const Center(
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ],
    ));
  }
}
