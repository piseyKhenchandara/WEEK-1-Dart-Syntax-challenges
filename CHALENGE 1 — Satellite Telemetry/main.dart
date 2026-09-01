import 'meansurement.dart';
import 'meansurementColllection.dart';
import 'sensorConfig.dart';

void main() {
  /* 
  final meansureCollection = Meansurementcolllection([
    meansureTemperature,
    meansureAltitude,
    meansureBattery,
    meansureNewTemperature,
  ]); */

  /* 1. Add a measurement
  Add: temperature / 24.5 / °C / "Normal"
  */
  final collection = Meansurementcolllection();
  collection.add(Meansurement("temperature", 24.5, "°C", comment: "Normal"));

  /* 
    2. Display all measurements
    temperature → 24.5 °C
    battery     → 87 %
    altitude    → 540 km
   */

  collection.add(Meansurement("Battery", 87, "%"));
  collection.add(Meansurement("altitude", 540, "km"));
  collection.DisplayMeansurements();

  /*
  3. Find measurements for a sensor
    Example:
    Find "temperature"
    → 24.5 °C
    → 27.2 °C
   */
  collection.add(Meansurement("temperature", 27.2, "°C", comment: "Normal"));
  collection.findTemperature("temperature");

  /* 
  
  4. Calculate the average
      Example:
      Average temperature
      24.5 + 27.2
      ──────────── = 25.85 °C
      2
   */

  collection.calAvg();

  /* 5. Check a sensor value against a configuration
    The user can define a sensor configuration:
    temperature
    minimum: 0
    maximum: 50
   */
  collection.add(Meansurement("temperature", -5, "°C"));

  collection.checkSensor(Sensorconfig("temperature", minimum:  0, maximum: 50 ));
  collection.checkSensor(Sensorconfig("Battery", minimum: 0, maximum: 100));
  
}
