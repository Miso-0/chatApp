import 'package:chittter_chatter_app/state/controllers/chats.dart';
import 'package:get/get.dart';

class Binder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatRoom());
  }
}
