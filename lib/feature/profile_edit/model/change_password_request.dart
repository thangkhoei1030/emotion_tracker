class ChangePasswordRequest {
  ChangePasswordRequest({
    this.oldPassword,
    this.newPassword,
    this.rePassword,
  });

  final String? oldPassword;
  final String? newPassword;
  final String? rePassword;

  ChangePasswordRequest copyWith({
    String? oldPassword,
    String? newPassword,
    String? rePassword,
  }) {
    return ChangePasswordRequest(
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
      rePassword: rePassword ?? this.rePassword,
    );
  }

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    return ChangePasswordRequest(
      oldPassword: json["old_password"],
      newPassword: json["new_password"],
      rePassword: json["re_password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "old_password": oldPassword,
        "new_password": newPassword,
        "re_password": rePassword,
      };

  @override
  String toString() {
    return "$oldPassword, $newPassword, $rePassword, ";
  }
}
