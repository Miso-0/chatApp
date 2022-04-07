// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);
import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
  User({
    required this.userPhone,
    required this.userName,
    required this.photoUrl,
  });

  String userPhone;
  String userName;
  String photoUrl;

  factory User.fromMap(Map<String, dynamic> json) => User(
        userPhone: json["userPhone"],
        userName: json["userName"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toMap() => {
        "userPhone": userPhone,
        "userName": userName,
        "photoUrl": photoUrl,
      };
}
