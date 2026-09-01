class Sensorconfig {
  String sensorName;
  double minimum = 0;
  double maximum = 50;

  Sensorconfig(this.sensorName, {this.minimum = 0, this.maximum = 0});

  void checkSensorValue(double value) {
    print(sensorName);
    if (value >= minimum && value <= maximum) {
      print("${value} -> OK");
    } else {
      print("${value} -> OUTSIDE RANGE");
    }
  }
}
