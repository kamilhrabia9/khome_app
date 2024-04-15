import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khome_app2/models/indicator_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircuralIndicator extends StatelessWidget {
  CircuralIndicator({
    required this.model,
  });

  //final void Function(int) select;
  IndicatorModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370 * model.scale,
      height: 450 * model.scale,
      //color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 180 * model.scale,
            lineWidth: 15 * model.scale,
            percent: model.tempToPer(),
            progressColor: Color.fromARGB(255, 131, 180, 204),
            backgroundColor: Colors.transparent,
            center: Text(
              model.displayValue(),
              style: TextStyle(
                fontSize: 60 * 0.5,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 131, 180, 204),
              ),
            ),
          ),
          SizedBox(
            height: 35 * model.scale,
          ),
          Center(
            child: Text(
              model.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 131, 180, 204),
                fontSize: 46 * model.scale,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
