import 'package:flutter/material.dart';

BoxDecoration containerBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.black26,
    boxShadow: const [
      BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 4)
    ]);

BoxDecoration containerBoxDecorationForCircle = const BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.black26,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        spreadRadius: 3,
        blurRadius: 8,
      )
    ]);

BoxDecoration homeContainerBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.blueGrey,
    boxShadow: const [
      BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 3)
    ]);

BoxDecoration homeContainerBoxDecorationActive = BoxDecoration(
    borderRadius: BorderRadius.circular(40),
    color: Colors.teal,
    boxShadow: const [
      BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 4)
    ]);
