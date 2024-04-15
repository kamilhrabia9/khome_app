import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khome_app2/data/rooms_data.dart';
import 'package:khome_app2/models/button_model.dart';
import 'package:khome_app2/models/button2state_model.dart';
import 'package:khome_app2/models/indicator_model.dart';
import 'package:khome_app2/models/weatherIndicator_model.dart';
import 'package:khome_app2/widgets/circularIndicator.dart';
import 'package:khome_app2/widgets/switchButton.dart';
import 'package:khome_app2/widgets/twoStateButton.dart';
import 'package:khome_app2/widgets/weatherIndicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(
      {Key? key,
      required this.buttons2State,
      required this.buttons,
      required this.indicators,
      required this.weatherIndicators});
  List<btn2stateModel> buttons2State = <btn2stateModel>[];
  List<ButtonModel> buttons = <ButtonModel>[];
  List<IndicatorModel> indicators = <IndicatorModel>[];
  List<WeatherIndicatrorModel> weatherIndicators = <WeatherIndicatrorModel>[];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _activateListener();
  }

  final dbRef = FirebaseDatabase.instance;
  int tOutside = 23; // temp od -20 do +50
  int humidityOutside = 60;
  int waterLvl = 80;
  int weatherState = 0;
  late StreamSubscription _dailySpecialStream;

  double tempToPer(int temp) {
    return (temp + 20) * 100 / 7000;
  }

  void _activateListener() {
    _dailySpecialStream = dbRef.ref().child('home').onValue.listen((event) {
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
      for (var i = 0; i < widget.weatherIndicators.length; i++) {
        final dbObject = map[widget.weatherIndicators[i].dbValue] as int;
        widget.weatherIndicators[i].setValueFromBase(dbObject);
      }

      setState(() {
        print("Data Base Working");
      });
    });
  }

  void powerSwitchChanged(int index) {
    setState(() {
      widget.buttons[index].state = !widget.buttons[index].state;
      http.put(
        Uri.https("khome-base-default-rtdb.europe-west1.firebasedatabase.app",
            "${widget.buttons[index].dbKey}/${widget.buttons[index].dbValue}.json"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(widget.buttons[index].state),
      );
      /*dbRef
          .ref()
          .child(widget.buttons[index]R.dbKey)
          .update({widget.buttons[index].dbValue: widget.buttons[index].state});*/
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

      /*dbRef.ref().child(widget.buttons2State[index].dbKey).update({
        widget.buttons2State[index].dbValue: widget.buttons2State[index].state
      });
      print(
          "State of ${widget.buttons2State[index].name}: ${widget.buttons2State[index].state} ");*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              child: CircuralIndicator(
            model: widget.indicators[0],
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircuralIndicator(
                  model: widget.indicators[1],
                ),
                WeatherIndicator(model: widget.weatherIndicators[0]),
                CircuralIndicator(
                  model: widget.indicators[2],
                ),
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
                    buttonModel: widget.buttons[0],
                    onChanged: () {
                      powerSwitchChanged(0);
                    }),
                TwoStateButton(
                    btn: widget.buttons2State[0],
                    onChanged: () {
                      state2BtnChg(0);
                    }),
                TwoStateButton(
                    btn: widget.buttons2State[1],
                    onChanged: () {
                      state2BtnChg(1);
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
                    buttonModel: widget.buttons[1],
                    onChanged: () {
                      powerSwitchChanged(1);
                    }),
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void deactivate() {
    _dailySpecialStream.cancel();
    super.deactivate();
  }
}
