import 'package:flutter/material.dart';

class ButtonModel {
  ButtonModel(
      {required this.name,
      required this.image,
      required this.state,
      required this.dbKey,
      required this.dbValue});
  final String image;
  final String name;
  bool state;
  final String dbKey;
  final String dbValue;

  void setValueFromBase(bool dbValue) {
    state = dbValue;
  }
}
