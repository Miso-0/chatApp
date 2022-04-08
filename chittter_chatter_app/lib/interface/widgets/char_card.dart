import 'package:chittter_chatter_app/state/controllers/chats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/models/chat_model.dart';
import '../../logic/models/user.dart';

Widget ChatCard(BuildContext context, Chat chat) {
  var chatRoomController = Get.find<ChatRoom>();
  var user = chatRoomController.getContactValid(chat.UserPhone);
  return InkWell(
    onTap: (() {
      Get.toNamed('/chatView', arguments: {"phone": user.userPhone});
    }),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade700,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chatRoomController.getContactLocalName(user.userPhone!),
                        style: GoogleFonts.roboto(
                          color: Colors.grey.shade400,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "01:38",
                        style: GoogleFonts.roboto(
                          color: Colors.grey.shade400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Wrap(
                    children: [
                      Text(
                        "recent text recent textrecent text rececent text recent text recent text",
                        style: GoogleFonts.roboto(
                          color: Colors.grey.shade400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 0.5,
                  color: const Color.fromRGBO(66, 66, 66, 0.9),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
