class EmotionStatisticalResponse {
  EmotionStatisticalResponse({
    this.date,
    this.point,
    this.icon,
  });

  final int? date;
  final int? point;
  final String? icon;

  EmotionStatisticalResponse copyWith({
    int? date,
    int? point,
    String? icon,
  }) {
    return EmotionStatisticalResponse(
      date: date ?? this.date,
      point: point ?? this.point,
      icon: icon ?? this.icon,
    );
  }

  factory EmotionStatisticalResponse.fromJson(Map<String, dynamic> json) {
    return EmotionStatisticalResponse(
      date: json["date"],
      point: json["point"],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() => {
        "date": date,
        "point": point,
        "icon": icon,
      };

  @override
  String toString() {
    return "$date, $point, $icon, ";
  }
}
