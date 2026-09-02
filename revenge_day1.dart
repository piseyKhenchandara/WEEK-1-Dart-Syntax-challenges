String studentName = "Pisey";
String? excuse;
const int passingScore = 50;
final DateTime examDate = DateTime.now();

List<String> mockScores = ["niggur", "diggur", "ducker"];

Map<String, String> weekTopics = {};

void main() {
  for (var i = 0; i < mockScores.length; i++) {
    var eachVar = "w$i";
    weekTopics[eachVar] = mockScores[i];
  }
  print(weekTopics);
}
