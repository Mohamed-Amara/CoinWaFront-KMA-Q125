// answer_model.dart
class AnswerModel {
  String? question1Answer;
  List<String> question2Answers = [];
  String? question3Answer;
  String? question4Answer;
  String? question5Answer;

  // Constructor to initialize the model with data
  AnswerModel({
    this.question1Answer,
    this.question2Answers = const [],
    this.question3Answer,
    this.question4Answer,
    this.question5Answer,
  });

  // Method to convert the answers into a format suitable for sending to the backend
  Map<String, dynamic> toJson() {
    return {
      'question1': question1Answer,
      'question2': question2Answers,
      'question3': question3Answer,
      'question4': question4Answer,
      'question5': question5Answer,
    };
  }
}
