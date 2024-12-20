class UserModel {
  String? username;
  String? name;
  String? email;
  String? password;
  String? phone;

  UserModel(
      {required this.email,
      required this.name,
      required this.password,
      this.phone,
      required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        name: json['name'],
        password: json['password'],
        phone: json['phone'],
        username: json['username']);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    };
  }
}
