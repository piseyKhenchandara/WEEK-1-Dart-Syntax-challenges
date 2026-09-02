import 'artist.dart';
import 'performance.dart';

class Stageschedule {
  final Map<String, List<Performance>> colletionStage = {};

  Stageschedule();

  void addPerformance(Performance performance) {
    colletionStage[performance.stage] ??= [];
    colletionStage[performance.stage]!.add(performance);
  }

  Performance? findArtist(Artist artist) {
    for (final list in colletionStage.values) {
      for (final p in list) {
        if (p.artist.name == artist.name) {
          return p;
        }
      }
    }
    return null;
  }


  
}
