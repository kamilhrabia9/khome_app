import 'package:flutter/material.dart';

class SliderModel {
  SliderModel({
    required this.name,
    required this.image,
    required this.state,
    required this.labels,
    required this.dbKey,
    required this.dbValue,
  });
  final String image;
  final String name;
  int state;
  double sliderValue = 0.0;
  List<String> labels = <String>[];
  String dbKey;
  String dbValue;

  void setValueFromBase(int dbValue) {
    if (dbValue >= 0 && dbValue < 4) {
      state = dbValue;
      switch (dbValue) {
        case 0:
          sliderValue = 0.0;
          break;
        case 1:
          sliderValue = 0.33;
          break;
        case 2:
          sliderValue = 0.67;
          break;
        case 3:
          sliderValue = 1.0;
          break;
        default:
          sliderValue = 0.0;
          break;
      }
    }
  }
}
