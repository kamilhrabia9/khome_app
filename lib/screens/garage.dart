import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:khome_app2/models/circle_mordel.dart';
import 'package:khome_app2/models/indicator_model.dart';
import 'package:khome_app2/widgets/sliderCircleWidget.dart';
import 'package:khome_app2/widgets/circularIndicator.dart';
import 'package:khome_app2/widgets/switchButton.dart';
import 'package:khome_app2/models/button_model.dart';

class GarageScreen extends StatefulWidget {
  GarageScreen({
    Key? key,
    required this.buttons,
    required this.circles,
    required this.indicators,
  });

  List<ButtonModel> buttons = <ButtonModel>[];
  List<CircleModel> circles = <CircleModel>[];
  List<IndicatorModel> indicators = <IndicatorModel>[];

  @override
  State<GarageScreen> createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  @override
  void initState() {
    super.initState();
    _activateListener();
  }

  final dbRef = FirebaseDatabase.instance;
  late StreamSubscription _dailySpecialStream;

  void powerSwitchChanged(int index) {
    setState(() {
      widget.buttons[index].state = !widget.buttons[index].state;
      http.put(
        Uri.https("khome-base-default-rtdb.europe-west1.firebasedatabase.app",
            "${widget.buttons[index].dbKey}/${widget.buttons[index].dbValue}.json"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(widget.buttons[index].state),
      );
    });
  }

  double tempToPer(int temp) {
    return (temp - 10) * 100 / 3000;
  }

  void _activateListener() {
    _dailySpecialStream = dbRef.ref().child('garage').onValue.listen((event) {
      Map<Object?, Object?> map = event.snapshot.value as Map<Object?, Object?>;
      for (var i = 0; i < widget.indicators.length; i++) {
        final dbObject = map[widget.indicators[i].dbValue].toString() as String;
        final dbDouble = double.tryParse(dbObject.toString());
        final double db = double.parse(dbDouble.toString());
        widget.indicators[i].setValueFromBase(db);
      }

      for (var i = 0; i < widget.buttons.length; i++) {
        final dbObject = map[widget.buttons[i].dbValue] as bool;
        widget.buttons[i].setValueFromBase(dbObject);
      }
      for (var i = 0; i < widget.circles.length; i++) {
        final dbObject = map[widget.circles[i].dbValueState] as bool;
        widget.circles[i].setValueFromBase(dbObject);
      }

      setState(() {
        print("Data Base Working");
      });
    });
  }

  int tCWU = 25;
  int tCWO = 20;
  int humidity = 15;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),

        Expanded(
          child: Container(
            // color: Colors.blueAccent,
            height: 260,
            child: SliderCircleWidget(model: widget.circles[0]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Center(
            child: Text(
              "Temp. CWU",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 131, 180, 204),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(10, 60, 10, 40),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircuralIndicator(model: widget.indicators[0]),
                CircuralIndicator(model: widget.indicators[1]),
                CircuralIndicator(model: widget.indicators[2]),
              ],
            ),
          ),
        ),

        /////// na probę
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SwitchButton(
                    buttonModel: widget.buttons[0],
                    onChanged: () {
                      powerSwitchChanged(0);
                    }),
                SwitchButton(
                    buttonModel: widget.buttons[1],
                    onChanged: () {
                      powerSwitchChanged(1);
                    }),
                SwitchButton(
                    buttonModel: widget.buttons[2],
                    onChanged: () {
                      powerSwitchChanged(2);
                    }),
              ],
            ),
          ),
        ),

        /// koniec
      ],
    );
  }

  @override
  void deactivate() {
    _dailySpecialStream.cancel();
    super.deactivate();
  }
}
