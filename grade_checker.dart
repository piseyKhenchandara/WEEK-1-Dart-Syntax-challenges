void main() {
  String getGrade(int score) {
    if (score >= 90) {
      return "A";
    } else if (score >= 80) {
      return "B";
    } else if (score >= 70) {
      return "C";
    } else {
      return "F";
    }
  }

  bool isPassing({required int score, int minScore = 70}) {
    if (score >= minScore) return true;
    return false;
  }

  List<int> scores = [95, 72, 40, 88, 55];

  for (var score in scores) {
    print(
      "Score : $score -> Grade: ${getGrade(score)} -> ${isPassing(score: score)}",
    );
  }
}


