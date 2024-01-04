class LoginRequest {
  LoginRequest({
    this.userName = "",
    this.password = "",
  });

  final String? userName;
  final String? password;

  LoginRequest copyWith({
    String? userName,
    String? password,
  }) {
    return LoginRequest(
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      userName: json["username"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": userName,
        "password": password,
      };

  @override
  String toString() {
    return "$userName, $password, ";
  }
}
