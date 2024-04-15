class WeatherIndicatrorModel {
  WeatherIndicatrorModel(
      {required this.name,
      required this.state,
      required this.dbKey,
      required this.dbValue});

  final String name;
  int state;
  final String dbKey;
  final String dbValue;

  void setValueFromBase(int dbValue) {
    if (dbValue >= 0 && dbValue < 5) {
      state = dbValue;
    }
  }
}
