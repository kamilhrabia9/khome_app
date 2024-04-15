//from home_screen
import 'package:khome_app2/models/button2state_model.dart';
import 'package:khome_app2/models/button_model.dart';
import 'package:khome_app2/models/circle_mordel.dart';
import 'package:khome_app2/models/indicator_model.dart';
import 'package:khome_app2/models/slider_model.dart';
import 'package:khome_app2/models/weatherIndicator_model.dart';

List<btn2stateModel> buttons2StateHome = <btn2stateModel>[
  btn2stateModel(
      name: "Brama",
      imageOpen: "gateOpen",
      imageLocked: "gate",
      state: 0,
      dbKey: "home",
      dbValue: "drivewayGate"),
  btn2stateModel(
      name: "Garaż",
      imageOpen: "garage",
      imageLocked: "smart-garage",
      state: 0,
      dbKey: "home",
      dbValue: "garageGate")
];
List<ButtonModel> buttonsHome = <ButtonModel>[
  ButtonModel(
      name: "Furtka",
      image: "open",
      state: false,
      dbKey: "home",
      dbValue: "gardenGate"),
  ButtonModel(
      name: "Ośw. zewn.",
      image: "bulb",
      state: false,
      dbKey: "home",
      dbValue: "lightOutside"),
  ButtonModel(
      name: "Ośw. ścieżki",
      image: "street-light",
      state: false,
      dbKey: "home",
      dbValue: "lightPath"),
  ButtonModel(
      name: "Podlewanie",
      image: "water-faucet",
      state: false,
      dbKey: "home",
      dbValue: "watering"),
];
List<IndicatorModel> indicatorsHome = <IndicatorModel>[
  IndicatorModel(
      title: "Na zewnątrz",
      value: 23,
      fraction: 1,
      scale: 0.5,
      minValue: -20,
      maxValue: 50,
      valueUnit: '\u00B0C',
      dbKey: "home",
      dbValue: "tempOut"),
  IndicatorModel(
      title: "Wilgotność",
      value: 50,
      fraction: 1,
      scale: 0.3,
      minValue: 0,
      maxValue: 100,
      valueUnit: '%',
      dbKey: "home",
      dbValue: "humidity"),
  IndicatorModel(
      title: "Poz. Wody",
      value: 60,
      fraction: 0,
      scale: 0.3,
      minValue: 0,
      maxValue: 100,
      valueUnit: '%',
      dbKey: "home",
      dbValue: "waterLevel"),
];
List<WeatherIndicatrorModel> weatherIndicatrorHome = <WeatherIndicatrorModel>[
  WeatherIndicatrorModel(
      name: "weather", state: 1, dbKey: "home", dbValue: "weatherState")
];
// end home_screen

//from livingroom_screen
List<btn2stateModel> buttons2StateLivingroom = <btn2stateModel>[
  btn2stateModel(
    name: "Okna",
    imageOpen: "openwindow",
    imageLocked: "window",
    state: 0,
    dbKey: "livingroom",
    dbValue: "window",
  ),
];
List<ButtonModel> buttonsLivingroom = <ButtonModel>[
  ButtonModel(
      name: "Lampa I",
      image: "bulb",
      state: false,
      dbKey: "livingroom",
      dbValue: "lightFirst"),
  ButtonModel(
      name: "Lampa II.",
      image: "bulb",
      state: false,
      dbKey: "livingroom",
      dbValue: "lightSecond"),
  ButtonModel(
      name: "Gniazdko I",
      image: "plug",
      state: false,
      dbKey: "livingroom",
      dbValue: "socketFirst"),
  ButtonModel(
      name: "Gniazdko II",
      image: "plug",
      state: false,
      dbKey: "livingroom",
      dbValue: "socketSecond"),
  ButtonModel(
      name: "Gniazdko III",
      image: "plug",
      state: false,
      dbKey: "livingroom",
      dbValue: "socketThird"),
];
List<SliderModel> slidersLivingroom = <SliderModel>[
  SliderModel(
      name: "Roleta",
      image: "blinds",
      state: 0,
      labels: ["O", "1", "2", "Z"],
      dbKey: "livingroom",
      dbValue: "blind"),
  SliderModel(
      name: "AC",
      image: "air-conditioner",
      state: 0,
      labels: ["OFF", "1", "2", "3"],
      dbKey: "livingroom",
      dbValue: "ac")
];
List<CircleModel> circlesLivingroom = <CircleModel>[
  CircleModel(
    name: "Salon",
    temperature: 24,
    valueMin: 16,
    valueMax: 32,
    circleValue: 0.5,
    heat: false,
    dbKey: "livingroom",
    dbValue: "temperatureSetting",
    dbValueState: "tempSetState",
  )
];

List<IndicatorModel> indicatorsLivingroom = <IndicatorModel>[
  IndicatorModel(
      title: "Temp. Otoczenia",
      value: 37,
      fraction: 1,
      scale: 0.3,
      minValue: 10,
      maxValue: 40,
      valueUnit: '\u00B0C',
      dbKey: "livingroom",
      dbValue: "tempAir"),
  IndicatorModel(
      title: "Wilgotność",
      value: 50,
      fraction: 1,
      scale: 0.3,
      minValue: 0,
      maxValue: 100,
      valueUnit: '%',
      dbKey: "livingroom",
      dbValue: "humidity"),
  IndicatorModel(
      title: "Temp. Podłogi",
      value: 25,
      fraction: 1,
      scale: 0.3,
      minValue: 10,
      maxValue: 40,
      valueUnit: '\u00B0C',
      dbKey: "livingroom",
      dbValue: "tempFloor"),
];
// end livingroom_screen

// from Bedroom

List<btn2stateModel> buttons2StateBedroom = <btn2stateModel>[
  btn2stateModel(
    name: "Okna",
    imageOpen: "openwindow",
    imageLocked: "window",
    state: 0,
    dbKey: "bedroom",
    dbValue: "window",
  ),
];
List<ButtonModel> buttonsBedroom = <ButtonModel>[
  ButtonModel(
      name: "Lampa I",
      image: "bulb",
      state: false,
      dbKey: "bedroom",
      dbValue: "lightFirst"),
  ButtonModel(
      name: "Lampa II.",
      image: "bulb",
      state: false,
      dbKey: "bedroom",
      dbValue: "lightSecond"),
  ButtonModel(
      name: "Gniazdko I",
      image: "plug",
      state: false,
      dbKey: "bedroom",
      dbValue: "socketFirst"),
  ButtonModel(
      name: "Gniazdko II",
      image: "plug",
      state: false,
      dbKey: "bedroom",
      dbValue: "socketSecond"),
  ButtonModel(
      name: "Gniazdko III",
      image: "plug",
      state: false,
      dbKey: "bedroom",
      dbValue: "socketThird"),
];
List<SliderModel> slidersBedroom = <SliderModel>[
  SliderModel(
      name: "Roleta",
      image: "blinds",
      state: 0,
      labels: ["O", "1", "2", "Z"],
      dbKey: "bedroom",
      dbValue: "blind"),
  SliderModel(
      name: "AC",
      image: "air-conditioner",
      state: 0,
      labels: ["OFF", "1", "2", "3"],
      dbKey: "bedroom",
      dbValue: "ac")
];
List<CircleModel> circlesBedroom = <CircleModel>[
  CircleModel(
    name: "Sypialnia",
    temperature: 24,
    valueMin: 16,
    valueMax: 32,
    circleValue: 0.5,
    heat: false,
    dbKey: "bedroom",
    dbValue: "temperatureSetting",
    dbValueState: "tempSetState",
  )
];

List<IndicatorModel> indicatorsBedroom = <IndicatorModel>[
  IndicatorModel(
      title: "Temp. Otoczenia",
      value: 23,
      fraction: 1,
      scale: 0.3,
      minValue: 10,
      maxValue: 40,
      valueUnit: '\u00B0C',
      dbKey: "bedroom",
      dbValue: "tempAir"),
  IndicatorModel(
      title: "Wilgotność",
      value: 50,
      fraction: 1,
      scale: 0.3,
      minValue: 0,
      maxValue: 100,
      valueUnit: '%',
      dbKey: "bedroom",
      dbValue: "humidity"),
  IndicatorModel(
      title: "Temp. Podłogi",
      value: 25,
      fraction: 1,
      scale: 0.3,
      minValue: 10,
      maxValue: 40,
      valueUnit: '\u00B0C',
      dbKey: "bedroom",
      dbValue: "tempFloor"),
];
// end bedroom

//from garage
List<ButtonModel> buttonsGarage = <ButtonModel>[
  ButtonModel(
      name: "Lampa",
      image: "bulb",
      state: false,
      dbKey: "garage",
      dbValue: "light"),
  ButtonModel(
      name: "Pomp. CWU",
      image: "fan",
      state: false,
      dbKey: "garage",
      dbValue: "pump"),
  ButtonModel(
      name: "Tryb",
      image: "auto",
      state: false,
      dbKey: "garage",
      dbValue: "mode"),
];
List<CircleModel> circlesGarage = <CircleModel>[
  CircleModel(
    name: "Garaż",
    temperature: 34,
    valueMin: 25,
    valueMax: 55,
    circleValue: 0.3,
    heat: false,
    dbKey: "garage",
    dbValue: "temperatureSetting",
    dbValueState: "tempSetState",
  )
];

List<IndicatorModel> indicatorsGarage = <IndicatorModel>[
  IndicatorModel(
      title: "Temp. zb. CWU",
      value: 25,
      fraction: 1,
      scale: 0.3,
      minValue: 10,
      maxValue: 55,
      valueUnit: '\u00B0C',
      dbKey: "garage",
      dbValue: "tempCWU"),
  IndicatorModel(
      title: "spare",
      value: 0,
      fraction: 0,
      scale: 0.3,
      minValue: 0,
      maxValue: 100,
      valueUnit: '',
      dbKey: "garage",
      dbValue: "spare"),
  IndicatorModel(
      title: "Temp. zb. CWO",
      value: 25,
      fraction: 1,
      scale: 0.3,
      minValue: 10,
      maxValue: 40,
      valueUnit: '\u00B0C',
      dbKey: "garage",
      dbValue: "tempCWO"),
];

// end garage
