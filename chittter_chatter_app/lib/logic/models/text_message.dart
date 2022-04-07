// To parse this JSON data, do
//
//     final textMessage = textMessageFromMap(jsonString);

import 'dart:convert';

List<TextMessage> textMessageFromMap(String str) =>
    List<TextMessage>.from(json.decode(str).map((x) => TextMessage.fromMap(x)));

String textMessageToMap(List<TextMessage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TextMessage {
  TextMessage({
    required this.originUserPhone,
    required this.destUserPhone,
    required this.content,
    required this.dateStamp,
  });

  String originUserPhone;
  String destUserPhone;
  String content;
  DateTime dateStamp;

  factory TextMessage.fromMap(Map<String, dynamic> json) => TextMessage(
        originUserPhone: json["originUserPhone"],
        destUserPhone: "",
        content: json["content"],
        dateStamp: DateTime.parse(json["dateStamp"]),
      );

  Map<String, dynamic> toMap() => {
        "originUserPhone": originUserPhone,
        "destUserPhone": destUserPhone,
        "content": content,
        "dateStamp": dateStamp.toIso8601String(),
      };
}
