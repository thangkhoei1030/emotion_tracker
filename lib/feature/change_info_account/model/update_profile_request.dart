class UpdateProfileRequest {
  UpdateProfileRequest({
    this.fullName,
    this.email,
    this.phone,
  });

  final String? fullName;
  final String? email;
  final String? phone;

  UpdateProfileRequest copyWith({
    String? fullName,
    String? email,
    String? phone,
  }) {
    return UpdateProfileRequest(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) {
    return UpdateProfileRequest(
      fullName: json["full_name"],
      email: json["email"],
      phone: json["phone"],
    );
  }

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
        "phone": phone,
      };

  @override
  String toString() {
    return "$fullName, $email, $phone, ";
  }
}
