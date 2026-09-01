import 'meansurement.dart';
import 'sensorConfig.dart';

class Meansurementcolllection {
  List<Meansurement> meansurements;

  Meansurementcolllection({List<Meansurement>? initMeansurements})
    : meansurements = initMeansurements ?? [];

  void add(Meansurement meansurement) {
    meansurements.add(meansurement);
  }

  void DisplayMeansurements() {
    for (final meansure in meansurements) {
      print("${meansure.sensorName} -> ${meansure.value} ${meansure.unit}");
    }
  }

  void findTemperature(String meansureName) {
    print("Find 'temperature'");
    for (final meansure in meansurements) {
      if (meansure.sensorName == meansureName) {
        print("-> ${meansure.value} ${meansure.unit}");
      }
    }
  }

  void calAvg() {
    print("Average temperature");

    final temps = meansurements
        .where((meansurement) => meansurement.sensorName == "temperature")
        .toList();

    final sum = temps
        .map((temp) => temp.value)
        .reduce((acc, curr) => acc + curr);
    print(sum / temps.length);
  }

  void checkSensor(Sensorconfig config) {
    for (final meansure in meansurements) {
      if (meansure.sensorName == config.sensorName) {
        config.checkSensorValue(57);
      }
    }
  }
}
