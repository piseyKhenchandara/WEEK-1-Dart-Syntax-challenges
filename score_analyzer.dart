void main() {
  List<int> scores = [95, 72, 40, 88, 55, 30, 91];
  // your code here

  List<int> filterPassing(List<int> scores, {int minScore = 50}) {
    final List<int> passScores = scores.where((s) => s >= 50).toList();
    return passScores;
  }

  print(filterPassing(scores));

  List<String> toLabels({required List<int> scores}) {
    final List<String> result = scores.map((s) {
      if (s >= 95) {
        return "$s A";
      } else if (s >= 80) {
        return "$s B";
      } else if (s >= 70) {
        return "$s C";
      } else {
        return "$s F";
      }
    }).toList();

    return result;
  }
}
