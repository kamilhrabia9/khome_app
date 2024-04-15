import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:khome_app2/models/circle_mordel.dart';
import 'package:khome_app2/support/utlis.dart';
import 'package:khome_app2/support/customDraw.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SliderCircleWidget extends StatefulWidget {
  SliderCircleWidget({Key? key, required this.model});
  CircleModel model;
  final dbRef = FirebaseDatabase.instance;
  @override
  _SliderCircleWidgetState createState() => _SliderCircleWidgetState();
}

class _SliderCircleWidgetState extends State<SliderCircleWidget> {
  void changeHeat() {
    setState(() {
      widget.model.heat = !widget.model.heat;
      /*widget.dbRef
          .ref()
          .child(widget.model.dbKey)
          .update({widget.model.dbValueState: widget.model.heat});*/
      http.put(
        Uri.https("khome-base-default-rtdb.europe-west1.firebasedatabase.app",
            "${widget.model.dbKey}/${widget.model.dbValueState}.json"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(widget.model.heat),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return SweepGradient(
                startAngle: degToRad(0),
                endAngle: degToRad(184),
                colors: [Colors.blue.shade200, Colors.grey.withAlpha(50)],
                stops: [widget.model.circleValue, widget.model.circleValue],
                transform: GradientRotation(
                  degToRad(178),
                ),
              ).createShader(rect);
            },
            child: Center(
              child: widget.model.heat ? CustomArc() : Container(),
            ),
          ),
          Center(
            child: Container(
              width: kDiameter - 30,
              height: kDiameter - 30,
              decoration: BoxDecoration(
                  color: Color(0xFCF6F5FF),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xFCF6F5FF),
                    width: 20,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 30,
                        spreadRadius: 10,
                        color: widget.model.heat
                            ? Color.fromARGB(255, 131, 180, 204).withAlpha(
                                normalize(widget.model.circleValue * 20000, 100,
                                        255)
                                    .toInt())
                            : Colors.grey.withAlpha(40),
                        offset: Offset(1, 3))
                  ]),
              child: SleekCircularSlider(
                min: widget.model.valueMin,
                max: widget.model.valueMax,
                initialValue: widget.model.temperature,
                appearance: CircularSliderAppearance(
                  startAngle: 180,
                  angleRange: 180,
                  size: kDiameter - 30,
                  customWidths: CustomSliderWidths(
                    trackWidth: 10,
                    shadowWidth: 0,
                    progressBarWidth: 01,
                    handlerSize: 15,
                  ),
                  customColors: CustomSliderColors(
                    hideShadow: true,
                    progressBarColor: Colors.transparent,
                    trackColor: Colors.transparent,
                    dotColor: widget.model.heat
                        ? Color.fromARGB(255, 131, 180, 204)
                        : Colors.transparent,
                  ),
                ),
                onChange: (value) {
                  setState(() {
                    widget.model.circleValue = normalize(
                        value, widget.model.valueMin, widget.model.valueMax);
                    widget.model.circleValue = widget.model.circleValue;
                    widget.model.temperature = value;

                    /*widget.dbRef.ref().child(widget.model.dbKey).update(
                        {widget.model.dbValue: widget.model.temperature});
                    */
                    http.put(
                      Uri.https(
                          "khome-base-default-rtdb.europe-west1.firebasedatabase.app",
                          "${widget.model.dbKey}/${widget.model.dbValue}.json"),
                      headers: {'Content-Type': 'application/json'},
                      body: json.encode(widget.model.temperature),
                    );

                    // do usuniecia prnt
                    print(
                        "Temperatura w ${widget.model.name}: ${widget.model.temperature} TEMP : $value");
                  });
                },
                innerWidget: (percentage) {
                  return InkWell(
                    onTap: () {
                      changeHeat();
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          widget.model.heat
                              ? '${percentage?.toInt()}°c'
                              : 'OFF',
                          style: TextStyle(
                              fontSize: 50,
                              color: Color.fromARGB(255, 131, 180, 204)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
