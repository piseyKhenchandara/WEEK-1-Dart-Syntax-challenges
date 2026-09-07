import 'performance.dart';

class Configrule {
  final double min_gap;
  final double max_time_perform;
  final bool allow_overlap;
  

  Configrule({
    this.min_gap = 0,
    this.max_time_perform = 90,
    this.allow_overlap= true,
    
  });

  
}
