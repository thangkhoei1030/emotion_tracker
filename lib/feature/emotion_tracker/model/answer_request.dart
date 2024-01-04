class AnswerRequest {
  AnswerRequest({
    this.quizId,
    this.questionId,
    this.answer,
  });

  final int? quizId;
  final int? questionId;
  final int? answer;

  AnswerRequest copyWith({
    int? quizId,
    int? questionId,
    int? answer,
  }) {
    return AnswerRequest(
      quizId: quizId ?? this.quizId,
      questionId: questionId ?? this.questionId,
      answer: answer ?? this.answer,
    );
  }

  factory AnswerRequest.fromJson(Map<String, dynamic> json) {
    return AnswerRequest(
      quizId: json["quiz_id"],
      questionId: json["question_id"],
      answer: json["answer"],
    );
  }

  Map<String, dynamic> toJson() => {
        "quiz_id": quizId,
        "question_id": questionId,
        "answer": answer,
      };

  @override
  String toString() {
    return "$quizId, $questionId, $answer, ";
  }
}
