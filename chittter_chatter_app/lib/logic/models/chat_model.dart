// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:get/get.dart';

import 'text_message.dart';

class Chat extends GetxController {
  String UserPhone;
  var messages;
  var unsentmessages;

  Chat({required this.UserPhone}) {
    messages = [].obs;
    unsentmessages = [].obs;
  }
}
