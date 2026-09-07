import 'artist.dart';
import 'configRule.dart';
import 'performance.dart';

class Stageschedule {
  final Map<String, List<Performance>> colletionStage = {};
  final Configrule rule;

  Stageschedule(this.rule);

  bool detechConflict(Performance perf) {
    final stage = colletionStage[perf.stage] ?? [];
    final gap = Duration(minutes: rule.min_gap.toInt());

    for (final existing in stage) {
      final existingStart = existing.startAt.subtract(gap);
      final existingEnd = existing.endAt.add(gap);

      if (perf.startAt.isBefore(existingEnd) &&
          existingStart.isBefore(perf.endAt)) {
        return true;
      }
    }
    return false;
  }

  void addPerformance(Performance performance) {
    final getInfo = detechConflict(performance);
    if (getInfo)
      print(
        "${performance.artist.name} - ${performance.stage} ${performance.startAt} - ${performance.endAt} conflict with the existing performance. chose another time or stage!",
      );
    else {
      print(
        "Add : ${performance.artist.name} - ${performance.stage} ${performance.startAt} - ${performance.endAt} successfully!",
      );
    }
    colletionStage[performance.stage] ??= [];
    colletionStage[performance.stage]!.add(performance);
  }

  List<Performance> listPerformance(String stage) {
    return colletionStage[stage] ?? [];

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


  int totalStage = 0;
  int get totalPerformance {
    for (final stage in colletionStage.values) {
      if (stage.length > 0) {
        totalStage++;
      }
    }
    return totalStage;
  }

  void ListStagesPerformance() {
    for (final stage in colletionStage.keys) {
      print("stage name : ${stage}");
      final performances= colletionStage[stage]!;
      for(final p in performances) {
        print("  ${p.artist.name}: ${p.startAt} - ${p.endAt}");
      }
    }
  }
}
