// ignore_for_file: avoid_print, unused_local_variable, unnecessary_overrides

import 'dart:async';
import 'dart:convert';

import 'package:chittter_chatter_app/logic/helpers/boxes.dart';
import 'package:chittter_chatter_app/logic/models/text_message.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../logic/models/chat_model.dart';

class ChatRoom extends GetxController {
  var chats = [].obs;

  @override
  void onInit() {
    //
    loadChats();
    super.onInit();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

//initialization helper
  init() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      getLatestText();
    });
    Timer.periodic(const Duration(seconds: 60), (timer) {
      resendUnsent();
    });
  }

  //load user chats
  void loadChats() async {
    final box = Boxes.getChats();
    // chats.clear();
    var chatslist = box.values.toList().cast<Chat>();
    for (Chat chat in chatslist) {
      chats.add(chat);
    }
  }

  //save chats list to on the device
  void saveChats() async {
    final box = Boxes.getChats();
    box.clear();
    for (Chat chat in chats) {
      box.add(chat);
    }
  }

//gets the latest messages while the app is running
  void getLatestText() async {
    try {
      for (Chat chat in chats) {
        var response = await http.get(Uri.parse('uri'));
        var texts = textMessageFromMap(response.body);
        if (texts.isNotEmpty) {
          for (TextMessage text in texts) {
            chat.messages.add(text);
          }
        }
        print(response.statusCode);
      }
    } catch (e) {
      print('Something went wrong');
    }
    saveChats();
  }

  //sends a message to a specified origin user phone
  void sendText(TextMessage message, int chatID) async {
    try {
      var request = await http.post(
        Uri.parse('uri'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(
          message.toMap(),
        ),
      );
      if (request.statusCode != 200) {
        addToUnsent(message, chatID);
      }
    } catch (e) {
      addToUnsent(message, chatID);
      print('Something went wrong');
    }
  }

//check if there are unsent messages and try to resend them
  void resendUnsent() {
    for (Chat chat in chats) {
      if (chat.unsentmessages.isNotEmpty) {
        for (TextMessage message in chat.unsentmessages) {
          sendText(message, chat.chatID);
        }
      }
    }
  }

// incase of an error e.g internet connection which results in a message not being sent, add it to the unsent message and will try to send it again later on
  void addToUnsent(TextMessage message, int chatID) async {
    for (Chat chat in chats) {
      if (chat.chatID.isEqual(chatID)) {
        if (!chat.unsentmessages.contains(message)) {
          chat.unsentmessages.add(message);
        }
      }
    }
  }
}
