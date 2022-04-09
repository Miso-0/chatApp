import 'package:chittter_chatter_app/interface/utils/resuable_const.dart';
import 'package:chittter_chatter_app/logic/models/text_message.dart';
import 'package:chittter_chatter_app/state/controllers/chats.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/models/chat_model.dart';
import '../../logic/models/user.dart';
import 'package:intl/intl.dart';

class ChartView extends StatefulWidget {
  const ChartView({Key? key}) : super(key: key);

  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  final contentFieldController = TextEditingController();
  bool canSand = false;
  final chatRoomContoller = Get.find<ChatRoom>();
  late String userPhone;
  late User user;
  late Chat chat;

  void setArgs(String phoneArg) {
    userPhone = phoneArg;
    user = chatRoomContoller.getContactValid(userPhone);
    if (chatRoomContoller.getChatByUser(userPhone) != null) {
      chat = chatRoomContoller.getChatByUser(userPhone)!;
    }
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    setArgs(args["phone"]);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: (() => Get.toNamed('/home')),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: primaryColor1,
            ),
          ),
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                radius: 16,
                backgroundImage: NetworkImage(user.photoUrl!),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    chatRoomContoller.getContactLocalName(userPhone),
                    style: GoogleFonts.roboto(
                      color: Colors.grey.shade300,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "last seen today at 01:50",
                    style: GoogleFonts.roboto(
                      color: Colors.grey.shade500,
                      fontSize: 11,
                    ),
                  ),
                ],
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.video_call_outlined,
                color: primaryColor1,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.phone_outlined,
                color: primaryColor1,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:
                          chatRoomContoller.getChatByUser(userPhone) != null
                              ? List.generate(
                                  chatRoomContoller
                                      .getChatByUser(userPhone)!
                                      .messages
                                      .length,
                                  (index) => chatRoomContoller
                                              .getChatByUser(userPhone)!
                                              .messages[index]
                                              .originUserPhone ==
                                          chatRoomContoller.originPhone
                                      ? senderTextCard(
                                          context,
                                          chatRoomContoller
                                              .getChatByUser(userPhone)!
                                              .messages[index])
                                      : receivedTextCard(
                                          context,
                                          chatRoomContoller
                                              .getChatByUser(userPhone)!
                                              .messages[index]))
                              : [const SizedBox()]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                // height: 30,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: primaryColor1,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: contentFieldController,
                          onChanged: ((value) {
                            if (contentFieldController.text.isNotEmpty) {
                              setState(() {
                                canSand = true;
                              });
                            } else {
                              setState(() {
                                canSand = false;
                              });
                            }
                          }),
                          minLines: 1,
                          maxLines: null,
                          maxLength: null,
                          style: GoogleFonts.roboto(
                            color: Colors.grey.shade300,
                          ),
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: primaryColor1,
                      ),
                    ),
                    Visibility(
                      visible: canSand,
                      child: IconButton(
                        onPressed: () {
                          if (contentFieldController.text.isNotEmpty) {
                            chatRoomContoller.modelMessageSend(
                                contentFieldController.text, userPhone);
                          }
                        },
                        icon: const Icon(
                          Icons.send_outlined,
                          color: primaryColor1,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !canSand,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.mic_outlined,
                          color: primaryColor1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row receivedTextCard(BuildContext context, TextMessage message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
          margin: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 0.75,
          // height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User text,',
                    style: GoogleFonts.roboto(
                      color: Colors.grey.shade300,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '14:20',
                        style: GoogleFonts.roboto(
                          color: Colors.grey.shade300,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String getTime(DateTime dateTime) {
  String formattedTime = DateFormat.Hm().format(dateTime);
  return formattedTime;
}

Row senderTextCard(BuildContext context, TextMessage message) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.75,
        // height: 50,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 1, 63, 47),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.content,
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade300,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      getTime(message.dateStamp),
                      style: GoogleFonts.roboto(
                        color: Colors.grey.shade300,
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
