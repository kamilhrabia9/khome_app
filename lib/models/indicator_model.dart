class IndicatorModel {
  IndicatorModel({
    required this.title,
    required this.value,
    required this.fraction,
    required this.scale,
    required this.minValue,
    required this.maxValue,
    required this.valueUnit,
    required this.dbKey,
    required this.dbValue,
  });
  final double scale;
  final String title;
  double value;
  final int minValue;
  final int maxValue;
  final String dbUnderKey = "/reads";
  final String dbKey;
  final String dbValue;
  final String valueUnit;
  final int fraction;

  double tempToPer() {
    return (this.value - this.minValue) / (this.maxValue - this.minValue);
  }

  String displayValue() {
    return "${value.toStringAsFixed(fraction)}$valueUnit";
  }

  void setValueFromBase(double dbValue) {
    if (dbValue >= minValue && dbValue <= maxValue) {
      value = dbValue;
    }
  }

  String getBasePath() {
    return "$dbKey$dbUnderKey";
  }
}
