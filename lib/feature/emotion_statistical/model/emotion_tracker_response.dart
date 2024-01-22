class EmotionStatisticalResponse {
  EmotionStatisticalResponse({
    this.date,
    this.point,
    this.icon,
    this.title,
    this.description,
  });

  final int? date;
  final int? point;
  final String? icon;
  final String? title;
  final String? description;

  EmotionStatisticalResponse copyWith({
    int? date,
    int? point,
    String? icon,
    String? title,
    String? description,
  }) {
    return EmotionStatisticalResponse(
      date: date ?? this.date,
      point: point ?? this.point,
      icon: icon ?? this.icon,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  factory EmotionStatisticalResponse.fromJson(Map<String, dynamic> json) {
    return EmotionStatisticalResponse(
      date: json["date"],
      point: json["point"],
      icon: json["icon"],
      title: json["title"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "date": date,
        "point": point,
        "icon": icon,
        "title": title,
        "description": description,
      };

  @override
  String toString() {
    return "$date, $point, $icon, $title, $description, ";
  }
}
