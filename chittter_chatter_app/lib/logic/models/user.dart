// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);
import 'dart:convert';

List<User> userFromMap(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

String userToMap(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class User {
  User({
    this.userPhone,
    this.userName,
    this.photoUrl,
  });

  String? userPhone;
  String? userName;
  String? photoUrl;

  factory User.fromMap(Map<String, dynamic> json) => User(
        userPhone: json["UserPhone"],
        userName: json["UserName"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toMap() => {
        "UserPhone": userPhone,
        "UserName": userName,
        "photoUrl": photoUrl,
      };
}
