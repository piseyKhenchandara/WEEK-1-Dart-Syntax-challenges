import 'meansurement.dart';
import 'satellite.dart';
import 'sensor.dart';

void main() {
  /* 1. Add a measurement
Add: temperature / 24.5 / °C / "Normal"

 */

  final meansureCollection = Satellite(meansureCollection: []);

  meansureCollection.addMeansure(
    Meansurement(
      Sensor(name: "temperature"),
      24.5,
      Unit.celsius,
      comment: "Normal",
    ),
  );

  /* 

      2. Display all measurements
    temperature → 24.5 °C
    battery     → 87 %
    altitude    → 540 km

      */

  meansureCollection.addMeansure(
    Meansurement(Sensor(name: "battery"), 87, Unit.percent),
  );
  meansureCollection.addMeansure(
    Meansurement(Sensor(name: "altitude"), 540, Unit.kilometer),
  );

  meansureCollection.displayAllMeansurements();

  /* 3. Find measurements for a sensor
    Example:
    Find "temperature"
    → 24.5 °C
    → 27.2 °C

 */

  meansureCollection.findAsensorMeansure(Sensor(name: "temperature"));

  /* 
  

  4. Calculate the average
    Example:
    Average temperature

    24.5 + 27.2
    ──────────── = 25.85 °C
        2

   */

  meansureCollection.addMeansure(
    Meansurement(
      Sensor(name: "temperature"),
      27.2,
      Unit.celsius,
      comment: "Normal",
    ),
  );

  meansureCollection.findAvg(Sensor(name: "temperature"));

  /* 

  5. Check a sensor value against a configuration
  The user can define a sensor configuration:
  temperature
  minimum: 0
  maximum: 50

  
   */

  meansureCollection.checkSensor(
    Sensor(
      name: "temperature",
      type: SensorType.temperature,
      validates: [CalculateValidate(0, 50)],
    ),
  );

   meansureCollection.checkSensor(
    Sensor(
      name: "temperature",
      type: SensorType.temperature,
      validates: [CalculateValidate(0, 10)],
    ),
  );
}
