import 'artist.dart';
import 'performance.dart';
import 'stageSchedule.dart';

void main() {
  final collectionStage = Stageschedule();

  collectionStage.addPerformance(
    Performance(
      artist: Artist("Ronan"),
      stage: "stageA",
      startAt: DateTime(2026, 9, 2, 19, 30),
      endAt: DateTime(2026, 9, 2, 8, 30),
    ),
  );
  
}
