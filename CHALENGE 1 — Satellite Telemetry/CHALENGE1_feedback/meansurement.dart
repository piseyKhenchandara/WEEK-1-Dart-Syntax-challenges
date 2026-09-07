import 'sensor.dart';

enum Unit {
  celsius,
  percent,
  kilometer
}


class Meansurement {
  final Sensor sensor;
  final double value;
  final Unit unit;
  final String? comment;

  Meansurement(this.sensor, this.value, this.unit, {this.comment});
}
