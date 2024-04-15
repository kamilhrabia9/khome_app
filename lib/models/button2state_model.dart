import 'package:flutter/material.dart';

class btn2stateModel {
  btn2stateModel(
      {required this.name,
      required this.imageOpen,
      required this.imageLocked,
      required this.state,
      required this.dbKey,
      required this.dbValue});
  final String imageOpen;
  final String imageLocked;
  final String name;
  int state;
  final String dbKey;
  final String dbValue;

  void setValueFromBase(int dbValue) {
    if (dbValue >= 0 && dbValue < 4) {
      state = dbValue;
    }
  }
}
