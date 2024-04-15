import 'package:flutter/material.dart';

class CircleModel {
  CircleModel({
    required this.name,
    required this.temperature,
    required this.valueMin,
    required this.valueMax,
    required this.circleValue,
    required this.heat,
    required this.dbKey,
    required this.dbValue,
    required this.dbValueState,
  });
  final String name;
  final double valueMin;
  final double valueMax;
  bool heat;
  double temperature;
  double circleValue;
  String dbKey;
  String dbValue;
  String dbValueState;

  void setValueFromBase(bool dbValue) {
    heat = dbValue;
  }
}
