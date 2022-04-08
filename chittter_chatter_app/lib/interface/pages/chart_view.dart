import 'package:chittter_chatter_app/interface/utils/resuable_const.dart';
import 'package:chittter_chatter_app/state/controllers/chats.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../logic/models/chat_model.dart';
import '../../logic/models/user.dart';

class ChartView extends StatefulWidget {
  const ChartView({Key? key}) : super(key: key);

  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  final contentFieldController = TextEditingController();
  bool canSand = false;
  @override
  Widget build(BuildContext context) {
    var chatRoomContoller = Get.find<ChatRoom>();
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    var userPhone = args["phone"];
    User user = chatRoomContoller.getContactValid(userPhone);
    Chat chat = chatRoomContoller.getChatByUser(userPhone) ??
        chatRoomContoller.createNewChat(userPhone);

    return SafeArea(
      child: Obx(
        () => Scaffold(
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
                Expanded(
                  child: ListView.builder(
                    itemCount: chat.messages.length,
                    itemBuilder: ((context, index) =>
                        chat.messages[index].originUserPhone ==
                                chatRoomContoller.originPhone
                            ? senderTextCard(
                                context,
                              )
                            : receivedTextCard(context)),
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send_outlined,
                            color: primaryColor1,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !canSand,
                        child: IconButton(
                          onPressed: () {
                            if (contentFieldController.text.isNotEmpty) {
                              chatRoomContoller.modelMessageSend(
                                  contentFieldController.text, chat.UserPhone);
                            }
                          },
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
      ),
    );
  }

  Row receivedTextCard(BuildContext context) {
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

Row senderTextCard(BuildContext context) {
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
