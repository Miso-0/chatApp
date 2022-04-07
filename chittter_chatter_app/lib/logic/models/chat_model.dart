import 'package:hive/hive.dart';

import 'text_message.dart';
part 'chat_model.g.dart';

@HiveType(typeId: 0)
class Chat {
  @HiveField(0)
  late int chatID;
  @HiveField(1)
  late List<TextMessage> messages;
  @HiveField(2)
  late List<TextMessage> unsentmessages;

  Chat() {
    messages = [];
    unsentmessages = [];
  }
}
