import 'dart:math';

import 'package:flutter/material.dart';

double degToRad(num deg) => deg * (pi / 180.0);

double normalize(value, min, max) => ((value - min) / (max - min));

const Color kScaffoldBackgroundColor = Color(0xFCF6F5FF);
const double kDiameter = 250;
const double kMinDegree = 10;
const double kMaxDegree = 35;
