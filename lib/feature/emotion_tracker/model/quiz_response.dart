import 'package:flutter/foundation.dart';

class QuizResponse {
  QuizResponse({
    this.id,
    this.customerId,
    this.created,
    this.totalResultOne,
    this.totalResultTwo,
    this.totalResultThree,
    this.totalResultFour,
    this.totalResultFive,
    this.quizsDetail = const [],
  });

  final int? id;
  final int? customerId;
  final int? created;
  final int? totalResultOne;
  final int? totalResultTwo;
  final int? totalResultThree;
  final int? totalResultFour;
  final int? totalResultFive;
  final List<QuizsDetail> quizsDetail;

  QuizResponse copyWith({
    int? id,
    int? customerId,
    int? created,
    int? totalResultOne,
    int? totalResultTwo,
    int? totalResultThree,
    int? totalResultFour,
    int? totalResultFive,
    List<QuizsDetail>? quizsDetail,
  }) {
    return QuizResponse(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      created: created ?? this.created,
      totalResultOne: totalResultOne ?? this.totalResultOne,
      totalResultTwo: totalResultTwo ?? this.totalResultTwo,
      totalResultThree: totalResultThree ?? this.totalResultThree,
      totalResultFour: totalResultFour ?? this.totalResultFour,
      totalResultFive: totalResultFive ?? this.totalResultFive,
      quizsDetail: quizsDetail ?? this.quizsDetail,
    );
  }

  factory QuizResponse.fromJson(Map<String, dynamic> json) {
    return QuizResponse(
      id: json["id"],
      customerId: json["customer_id"],
      created: json["created"],
      totalResultOne: json["total_result_one"],
      totalResultTwo: json["total_result_two"],
      totalResultThree: json["total_result_three"],
      totalResultFour: json["total_result_four"],
      totalResultFive: json["total_result_five"],
      quizsDetail: json["QuizsDetail"] == null
          ? []
          : List<QuizsDetail>.from(
              json["QuizsDetail"]!.map((x) => QuizsDetail.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "created": created,
        "total_result_one": totalResultOne,
        "total_result_two": totalResultTwo,
        "total_result_three": totalResultThree,
        "total_result_four": totalResultFour,
        "total_result_five": totalResultFive,
        "QuizsDetail": quizsDetail.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$id, $customerId, $created, $totalResultOne, $totalResultTwo, $totalResultThree, $totalResultFour, $totalResultFive, $quizsDetail, ";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QuizResponse &&
      other.id == id &&
      other.customerId == customerId &&
      other.created == created &&
      other.totalResultOne == totalResultOne &&
      other.totalResultTwo == totalResultTwo &&
      other.totalResultThree == totalResultThree &&
      other.totalResultFour == totalResultFour &&
      other.totalResultFive == totalResultFive &&
      listEquals(other.quizsDetail, quizsDetail);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      customerId.hashCode ^
      created.hashCode ^
      totalResultOne.hashCode ^
      totalResultTwo.hashCode ^
      totalResultThree.hashCode ^
      totalResultFour.hashCode ^
      totalResultFive.hashCode ^
      quizsDetail.hashCode;
  }
}

class QuizsDetail {
  const QuizsDetail({
    this.id,
    this.questionId,
    this.questionName,
    this.questionDescription,
    this.questionColor,
    this.questionIcon,
    this.answer,
    this.executionTime,
    this.isAnswerDone = false,
  });

  final int? id;
  final int? questionId;
  final String? questionName;
  final String? questionDescription;
  final String? questionColor;
  final String? questionIcon;
  final int? answer;
  final dynamic executionTime;
  final bool isAnswerDone;

  QuizsDetail copyWith({
    int? id,
    int? questionId,
    String? questionName,
    String? questionDescription,
    String? questionColor,
    String? questionIcon,
    int? answer,
    dynamic? executionTime,
    bool? isAnswerDone,
  }) {
    return QuizsDetail(
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      questionName: questionName ?? this.questionName,
      questionDescription: questionDescription ?? this.questionDescription,
      questionColor: questionColor ?? this.questionColor,
      questionIcon: questionIcon ?? this.questionIcon,
      answer: answer ?? this.answer,
      executionTime: executionTime ?? this.executionTime,
      isAnswerDone: isAnswerDone ?? this.isAnswerDone,
    );
  }

  factory QuizsDetail.fromJson(Map<String, dynamic> json) {
    return QuizsDetail(
      id: json["id"],
      questionId: json["question_id"],
      questionName: json["question_name"],
      questionDescription: json["question_description"],
      questionColor: json["question_color"],
      questionIcon: json["question_icon"],
      answer: json["answer"],
      executionTime: json["execution_time"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "question_id": questionId,
        "question_name": questionName,
        "question_description": questionDescription,
        "question_color": questionColor,
        "question_icon": questionIcon,
        "answer": answer,
        "execution_time": executionTime,
      };

  @override
  String toString() {
    return "$id, $questionId, $questionName, $questionDescription, $questionColor, $questionIcon, $answer, $executionTime, ";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QuizsDetail &&
      other.id == id &&
      other.questionId == questionId &&
      other.questionName == questionName &&
      other.questionDescription == questionDescription &&
      other.questionColor == questionColor &&
      other.questionIcon == questionIcon &&
      other.answer == answer &&
      other.executionTime == executionTime &&
      other.isAnswerDone == isAnswerDone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      questionId.hashCode ^
      questionName.hashCode ^
      questionDescription.hashCode ^
      questionColor.hashCode ^
      questionIcon.hashCode ^
      answer.hashCode ^
      executionTime.hashCode ^
      isAnswerDone.hashCode;
  }
}
