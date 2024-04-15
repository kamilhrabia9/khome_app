import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khome_app2/screens/bedroom.dart';
import 'package:khome_app2/screens/garage.dart';
import 'package:khome_app2/screens/home.dart';
import 'package:khome_app2/screens/livingroom.dart';
import 'package:khome_app2/widgets/bottomBar.dart';
import 'package:khome_app2/data/rooms_data.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late List<Widget> _screens = <Widget>[
    HomeScreen(
      buttons2State: buttons2StateHome,
      buttons: buttonsHome,
      indicators: indicatorsHome,
      weatherIndicators: weatherIndicatrorHome,
    ),
    LivingroomScreen(
      buttons2State: buttons2StateLivingroom,
      buttons: buttonsLivingroom,
      sliders: slidersLivingroom,
      circles: circlesLivingroom,
      indicators: indicatorsLivingroom,
    ),
    BedroomScreen(
      buttons2State: buttons2StateBedroom,
      buttons: buttonsBedroom,
      sliders: slidersBedroom,
      circles: circlesBedroom,
      indicators: indicatorsBedroom,
    ),
    GarageScreen(
      buttons: buttonsGarage,
      circles: circlesGarage,
      indicators: indicatorsGarage,
    ),
  ];

  void select(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _screens.elementAt(_selectedIndex),
        bottomNavigationBar: BottomBar(ind: _selectedIndex, select: select),
        backgroundColor: Color(0xFCF6F5FF),
      ),
    );
  }
}
