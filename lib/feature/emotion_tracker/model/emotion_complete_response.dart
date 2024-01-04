class EmotionCompleteResponse {
  EmotionCompleteResponse({
    this.pointPositive,
    this.pointNegative,
    this.totalPointPositive,
    this.totalPointNegative,
  });

  final int? pointPositive;
  final int? pointNegative;
  final int? totalPointPositive;
  final int? totalPointNegative;

  EmotionCompleteResponse copyWith({
    int? pointPositive,
    int? pointNegative,
    int? totalPointPositive,
    int? totalPointNegative,
  }) {
    return EmotionCompleteResponse(
      pointPositive: pointPositive ?? this.pointPositive,
      pointNegative: pointNegative ?? this.pointNegative,
      totalPointPositive: totalPointPositive ?? this.totalPointPositive,
      totalPointNegative: totalPointNegative ?? this.totalPointNegative,
    );
  }

  factory EmotionCompleteResponse.fromJson(Map<String, dynamic> json) {
    return EmotionCompleteResponse(
      pointPositive: json["point_positive"],
      pointNegative: json["point_negative"],
      totalPointPositive: json["total_point_positive"],
      totalPointNegative: json["total_point_negative"],
    );
  }

  Map<String, dynamic> toJson() => {
        "point_positive": pointPositive,
        "point_negative": pointNegative,
        "total_point_positive": totalPointPositive,
        "total_point_negative": totalPointNegative,
      };

  @override
  String toString() {
    return "$pointPositive, $pointNegative, $totalPointPositive, $totalPointNegative, ";
  }
}
