import 'meansurement.dart';
import 'sensor.dart';


class Satellite {
  final List<Meansurement> _meansureCollection;

  Satellite({required List<Meansurement> meansureCollection})
    : _meansureCollection = meansureCollection;

  void addMeansure(Meansurement meansurement) {
    _meansureCollection.add(meansurement);
  }

  void displayAllMeansurements() {
    for (final meansurement in _meansureCollection) {
      print(
        "${meansurement.sensor.name} -> ${meansurement.value} ${meansurement.unit}",
      );
    }
  }

  void findAsensorMeansure(Sensor sensor) {
    for (final meansurement in _meansureCollection) {
      if (meansurement.sensor.name == sensor.name) {
        print("find ${sensor.name}");
        print((" -> ${meansurement.value} ${meansurement.unit}"));
      }
    }
  }

  void findAvg(Sensor sensor) {
    print("Average ${sensor.name}");

    final typeSensors = _meansureCollection
        .where((meansurement) => meansurement.sensor.name == sensor.name)
        .toList();
    final result = typeSensors
        .map((typeSensor) => typeSensor.value)
        .toList()
        .reduce((first, curr) => first + curr);
    print("${result / typeSensors.length} ${typeSensors.first.unit}");
  }

  void checkSensor(Sensor sensor) {
    print(sensor.name);
    for (final meansurement in _meansureCollection) {
      if (meansurement.sensor.name == sensor.name) {
        sensor.checkSensorValue(meansurement.value);
      }
    }
  }
}
