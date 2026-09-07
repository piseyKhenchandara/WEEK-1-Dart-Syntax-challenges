enum SensorType { temperature, battery, altitude }

abstract class Validate {
  bool isValid(double value);
  String get errorMessage;
}

class CalculateValidate implements Validate {
  final double minimum;
  final double maximum;

  CalculateValidate(this.minimum, this.maximum);

  @override
  bool isValid(double value) => value >= minimum && value <= maximum;

  @override
  String get errorMessage => "Out of data range";
}

class Sensor {
  final String name;
  final SensorType? type;
  List<Validate>? validates;

  Sensor({required this.name, this.type, this.validates});

  void checkSensorValue(double value) {
    for (final validate in validates ?? []) {
      if (validate.isValid(value)) {
        print("${value} -> ok");
      } else {
        print("${validate.errorMessage}");
      }
    }
  }
}
