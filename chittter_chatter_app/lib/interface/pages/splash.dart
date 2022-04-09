import 'package:chittter_chatter_app/interface/utils/resuable_const.dart';
import 'package:chittter_chatter_app/state/controllers/chats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/models/user.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);
  final phoneController = TextEditingController();
  final userNameController = TextEditingController();
  final chatRoomController = Get.find<ChatRoom>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: GoogleFonts.roboto(
                  color: primaryColor1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: phoneController,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                  ),
                  maxLength: 10,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    hintStyle: GoogleFonts.roboto(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userNameController,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                  ),
                  maxLength: 25,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: GoogleFonts.roboto(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {
                if (userNameController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty) {
                  String img =
                      "https://scontent-jnb1-1.cdninstagram.com/v/t51.2885-19/277919165_433203125234765_8194864899084439128_n.jpg?stp=dst-jpg_s150x150&_nc_ht=scontent-jnb1-1.cdninstagram.com&_nc_cat=105&_nc_ohc=Mg7iSSIc_yEAX9xGZ7d&edm=ALQROFkBAAAA&ccb=7-4&oh=00_AT_iHpArm-MYXSQdOBmGk5Pa55aaCTLOpShqxwfEWNffgQ&oe=625582AE&_nc_sid=30a2ef";
                  var user = User(
                      userName: userNameController.text,
                      userPhone: phoneController.text,
                      photoUrl: img);
                  chatRoomController.authenticateUser(user).whenComplete(() {
                    chatRoomController.originPhone = phoneController.text;
                    Get.toNamed('/home');
                  });
                }
              }),
              child: Container(
                width: 150,
                height: 50,
                child: Center(
                  child: Text(
                    'Procced',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
