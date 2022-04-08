// ignore_for_file: avoid_print, unused_local_variable, unnecessary_overrides

import 'dart:async';
import 'dart:convert';
import 'package:chittter_chatter_app/logic/models/text_message.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../logic/models/chat_model.dart';
import '../../logic/models/user.dart';

class LocalContact {
  String phone;
  String name;
  LocalContact({required this.phone, required this.name});
}

final String baseUrl = "https://0c27-41-198-134-165.ngrok.io";

class ChatRoom extends GetxController {
  var chats = [].obs;
  var ch = ["User 1", "User 2", "User 3", "User 4"].obs;
  var originPhone = "0719582572";

  var phoneContacts = [
    LocalContact(phone: "0719582574", name: 'Oupa'),
    LocalContact(phone: "0719582575", name: 'Jerry'),
    LocalContact(phone: "0719582576", name: 'Absa'),
    LocalContact(phone: "0719582577", name: 'MM'),
  ].obs;

  var validContacts = [].obs;

  @override
  void onInit() {
    //
    getContacts();
    super.onInit();
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

  String getContactLocalName(String userPhone) {
    String name = "";
    for (LocalContact c in phoneContacts) {
      if (c.phone == userPhone) {
        name = c.name;
      }
    }
    return name;
  }

  User getContactValid(String userPhone) {
    int index = 0;
    for (int i = 0; i < validContacts.length; i++) {
      if (validContacts[i].userPhone == userPhone) {
        index = i;
      }
    }
    return validContacts[index];
  }

  //load user chats
  void loadChats() async {}

  //save chats list to on the device
  void saveChats() async {}

  //get user(userPhone)
  Future<void> getContacts() async {
    try {
      for (LocalContact contact in phoneContacts) {
        String url =
            baseUrl + "/chat/users/userPhone?userPhone=" + contact.phone;
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          if (response.body != "[]") {
            var usersFound = userFromMap(response.body);
            for (User user in usersFound) {
              validContacts.add(user);
            }
          }
        }
      }
    } catch (e) {
      print('Something went wrong');
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

  //model a message
  void modelMessageSend(String content, String dest) {
    if (getChatByUser(dest) != null) {
      var chat = getChatByUser(dest);
      var message = TextMessage(
        originUserPhone: originPhone,
        destUserPhone: dest,
        content: content,
        dateStamp: DateTime.now(),
      );
      sendText(
        message,
        dest,
      );
      chat!.messages.add(message);
    } else {
      var message = TextMessage(
        originUserPhone: originPhone,
        destUserPhone: dest,
        content: content,
        dateStamp: DateTime.now(),
      );
      sendText(
        message,
        dest,
      );
      var newChat = Chat(UserPhone: dest);
      newChat.messages.add(message);
      chats.add(newChat);
    }
  }

//get a specific chat based on userInfor
  Chat? getChatByUser(String userPhone) {
    Chat? chat;
    for (Chat chatObj in chats) {
      if (chatObj.UserPhone == userPhone) {
        chat = chatObj;
      }
    }
    return chat;
  }

  //sends a message to a specified origin user phone
  void sendText(TextMessage message, String userPhone) async {
    try {
      String url = baseUrl + "/chat/texts";
      var request = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(
          message.toMap(),
        ),
      );
      if (request.statusCode != 200) {
        addToUnsent(message, userPhone);
      }
    } catch (e) {
      addToUnsent(message, userPhone);
      print('Something went wrong');
    }
  }

//check if there are unsent messages and try to resend them
  void resendUnsent() {
    for (Chat chat in chats) {
      if (chat.unsentmessages.isNotEmpty) {
        for (TextMessage message in chat.unsentmessages) {
          sendText(message, chat.UserPhone);
        }
      }
    }
  }

// incase of an error e.g internet connection which results in a message not being sent, add it to the unsent message and will try to send it again later on
  void addToUnsent(TextMessage message, String userPhone) async {
    for (Chat chat in chats) {
      if (chat.UserPhone == userPhone) {
        if (!chat.unsentmessages.contains(message)) {
          chat.unsentmessages.add(message);
        }
      }
    }
  }

//creates a new chat for a user
  Chat createNewChat(userPhone) {
    var newChat = Chat(UserPhone: userPhone);
    chats.add(newChat);
    return newChat;
  }
}
