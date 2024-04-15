import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:khome_app2/models/slider_model.dart';

class SliderWidget extends StatefulWidget {
  SliderWidget({Key? key, required this.model}) {
    print("SLIDER ${model.name}");
  }
  SliderModel model;
  final dbRef = FirebaseDatabase.instance;

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  void _updateSliderValue(double value) {
    setState(() {
      if (value < 0.25) {
        widget.model.sliderValue = 0.0;
        widget.model.state = 0;
      } else if (value < 0.5) {
        widget.model.sliderValue = 0.33;
        widget.model.state = 1;
      } else if (value < 0.75) {
        widget.model.sliderValue = 0.67;
        widget.model.state = 2;
      } else {
        widget.model.sliderValue = 1.0;
        widget.model.state = 3;
      }

      /* widget.dbRef
          .ref()
          .child(widget.model.dbKey)
          .update({widget.model.dbValue: widget.model.state}); */
      http.put(
        Uri.https("khome-base-default-rtdb.europe-west1.firebasedatabase.app",
            "${widget.model.dbKey}/${widget.model.dbValue}.json"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(widget.model.state),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 200,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Container(
              height: 40,
              width: 40,
              child: Image.asset(
                'lib/icons/${widget.model.image}.png',
                color: Color.fromARGB(255, 131, 180, 204),
              ),
            ),
          ),
          Container(
            width: 150,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.model.name,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 131, 180, 204),
                    ),
                  ),
                  Slider(
                    value: widget.model.sliderValue,
                    onChanged: _updateSliderValue,
                    activeColor: Color.fromARGB(255, 131, 180, 204),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.model.labels[0],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 131, 180, 204),
                          ),
                        ),
                        Text(
                          widget.model.labels[1],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 131, 180, 204),
                          ),
                        ),
                        Text(
                          widget.model.labels[2],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 131, 180, 204),
                          ),
                        ),
                        Text(
                          widget.model.labels[3],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 131, 180, 204),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
