import 'package:chittter_chatter_app/logic/models/chat_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Chat> getChats() => Hive.box("ChatBox");
}
