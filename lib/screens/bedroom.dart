import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khome_app2/models/button2state_model.dart';
import 'package:khome_app2/models/circle_mordel.dart';
import 'package:khome_app2/models/indicator_model.dart';
import 'package:khome_app2/models/slider_model.dart';
import 'package:khome_app2/widgets/sliderCircleWidget.dart';
import 'package:khome_app2/widgets/circularIndicator.dart';
import 'package:khome_app2/widgets/sliderWidget.dart';
import 'package:khome_app2/widgets/switchButton.dart';
import 'package:khome_app2/models/button_model.dart';
import 'package:khome_app2/widgets/twoStateButton.dart';

class BedroomScreen extends StatefulWidget {
  BedroomScreen(
      {Key? key,
      required this.buttons2State,
      required this.buttons,
      required this.sliders,
      required this.circles,
      required this.indicators});
  List<btn2stateModel> buttons2State = <btn2stateModel>[];
  List<ButtonModel> buttons = <ButtonModel>[];
  List<SliderModel> sliders = <SliderModel>[];
  List<CircleModel> circles = <CircleModel>[];
  List<IndicatorModel> indicators = <IndicatorModel>[];

  @override
  State<BedroomScreen> createState() => _BedroomScreenState();
}

class _BedroomScreenState extends State<BedroomScreen> {
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

  void state2BtnChg(int index) {
    setState(() {
      widget.buttons2State[index].state += 1;
      if (widget.buttons2State[index].state > 3) {
        widget.buttons2State[index].state = 0;
      }
      http.put(
        Uri.https("khome-base-default-rtdb.europe-west1.firebasedatabase.app",
            "${widget.buttons2State[index].dbKey}/${widget.buttons2State[index].dbValue}.json"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(widget.buttons2State[index].state),
      );
    });
  }

  double tempToPer(int temp) {
    return (temp - 10) * 100 / 3000;
  }

  void _activateListener() {
    _dailySpecialStream = dbRef.ref().child('bedroom').onValue.listen((event) {
      Map<Object?, Object?> map = event.snapshot.value as Map<Object?, Object?>;
      for (var i = 0; i < widget.indicators.length; i++) {
        final dbObject = map[widget.indicators[i].dbValue].toString() as String;
        final dbDouble = double.tryParse(dbObject.toString());
        final double db = double.parse(dbDouble.toString());
        widget.indicators[i].setValueFromBase(db);
      }
      for (var i = 0; i < widget.buttons2State.length; i++) {
        final dbObject = map[widget.buttons2State[i].dbValue] as int;
        widget.buttons2State[i].setValueFromBase(dbObject);
      }
      for (var i = 0; i < widget.buttons.length; i++) {
        final dbObject = map[widget.buttons[i].dbValue] as bool;
        widget.buttons[i].setValueFromBase(dbObject);
      }
      for (var i = 0; i < widget.sliders.length; i++) {
        final dbObject = map[widget.sliders[i].dbValue] as int;
        widget.sliders[i].setValueFromBase(dbObject);
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

  int tAir = 23;
  int tFloor = 25;
  int humidity = 45;

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
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SliderWidget(model: widget.sliders[0]),
                SizedBox(
                  width: 3,
                ),
                SliderWidget(model: widget.sliders[1]),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircuralIndicator(
                  model: widget.indicators[0],
                ),
                CircuralIndicator(model: widget.indicators[1]),
                CircuralIndicator(model: widget.indicators[2]), // scale 0.3
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
                TwoStateButton(
                    btn: widget.buttons2State[0],
                    onChanged: () {
                      state2BtnChg(0);
                    }),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SwitchButton(
                    buttonModel: widget.buttons[2],
                    onChanged: () {
                      powerSwitchChanged(2);
                    }),
                SwitchButton(
                    buttonModel: widget.buttons[3],
                    onChanged: () {
                      powerSwitchChanged(3);
                    }),
                SwitchButton(
                    buttonModel: widget.buttons[4],
                    onChanged: () {
                      powerSwitchChanged(4);
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
