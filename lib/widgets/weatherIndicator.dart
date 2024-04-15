import 'package:flutter/material.dart';
import 'package:khome_app2/models/weatherIndicator_model.dart';

class WeatherIndicator extends StatelessWidget {
  WeatherIndicator({
    super.key,
    required this.model,
    // required this.select,
  });
  WeatherIndicatrorModel model;

  Image weatherSelect(int weather) {
    Image tempImage;
    switch (weather) {
      case 0:
        tempImage = Image.asset(
          'lib/icons/sunny.png',
          color: Color.fromARGB(255, 255, 211, 65),
        );
        break;
      case 1:
        tempImage = Image.asset(
          'lib/icons/cloudy.png',
          color: Colors.blueGrey,
        );
        break;
      case 2:
        tempImage = Image.asset(
          'lib/icons/rainy.png',
          color: const Color.fromARGB(255, 2, 109, 163),
        );
        break;
      case 3:
        tempImage = Image.asset(
          'lib/icons/moon.png',
          color: Color.fromARGB(255, 156, 133, 58),
        );
        break;
      case 4:
        tempImage = Image.asset(
          'lib/icons/rainy-night.png',
          color: Color.fromARGB(255, 27, 56, 70),
        );
        break;
      default:
        tempImage = Image.asset(
          'lib/icons/sunny.png',
          color: Color.fromARGB(255, 255, 211, 65),
        );
        break;
    }
    return tempImage;
  }
  //final int ind;
  //final void Function(int) select;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          height: 120,
          child: weatherSelect(model.state),
        ),
      ),
    );
  }
}
