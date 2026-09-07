import 'artist.dart';
import 'configRule.dart';
import 'performance.dart';
import 'stageSchedule.dart';

void main() {
  final collectionStage = Stageschedule(Configrule(min_gap: 15));

  // Add performances
  collectionStage.addPerformance(
    Performance(
      artist: Artist("Ronan"),
      stage: "stageA",
      startAt: DateTime(2026, 9, 2, 19, 30),
      endAt: DateTime(2026, 9, 2, 20, 30),
    ),
  );

  collectionStage.addPerformance(
    Performance(
      artist: Artist("makara"),
      stage: "stageA",
      startAt: DateTime(2026, 9, 2, 20, 41),
      endAt: DateTime(2026, 9, 2, 21, 45),
    ),
  );
  print(collectionStage.listPerformance("stageC"));

  // Find an artist's performance
  /* 
  
    Detect scheduling conflicts 
	  Calculate basic schedule information 

 */
  final p = collectionStage.findArtist(Artist("Ronan"));
  print("found ${p!.artist.name} on ${p.stage} at ${p.startAt} - ${p.endAt}");
  print(collectionStage.totalPerformance);
  collectionStage.ListStagesPerformance();
}
