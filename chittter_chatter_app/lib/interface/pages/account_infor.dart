import 'package:chittter_chatter_app/interface/utils/resuable_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountInfo extends StatefulWidget {
  AccountInfo({Key? key}) : super(key: key);

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  final TextEditingController txtUsername = TextEditingController();

  final TextEditingController txtPhone = TextEditingController();

  int charLeft = 25;
  bool canType = true;
  bool editing = false;

  void updateChars() {
    setState(() {
      if (canType) {
        charLeft = charLeft - txtUsername.text.length;
      } else if (charLeft <= 0) {
        charLeft = 0;
        canType = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // txtUsername.text = "Username";
    // txtPhone.text = "Username";
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: editing
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      editing = false;
                    });
                    FocusScope.of(context).unfocus();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: primaryColor1,
                    size: 20,
                  ),
                )
              : IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: primaryColor1,
                    size: 20,
                  ),
                ),
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: GoogleFonts.roboto(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Visibility(
              visible: editing,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    editing = false;
                  });
                  FocusScope.of(context).unfocus();
                },
                child: Text(
                  'Done',
                  style: GoogleFonts.roboto(
                    color: primaryColor1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              //  height: MediaQuery.of(context).size.height * 0.2,
              color: Colors.grey.shade900,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey.shade400,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Edit',
                              style: GoogleFonts.roboto(
                                  color: primaryColor1, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Wrap(
                            children: [
                              Text(
                                'Enter your name and add an optional profile picture',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade700,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.86,
                          child: TextField(
                            controller: txtUsername,
                            onTap: () {
                              setState(() {
                                editing = true;
                              });
                            },
                            onChanged: (v) {
                              updateChars();
                            },
                            maxLines: 1,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.grey.shade300,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Name',
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.roboto(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          charLeft.toString(),
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade700,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.86,
                          child: TextField(
                            controller: txtUsername,
                            onTap: () {
                              setState(() {
                                editing = true;
                              });
                            },
                            onChanged: (v) {
                              updateChars();
                            },
                            maxLines: 1,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.grey.shade300,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'About',
                              hintStyle: GoogleFonts.roboto(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          charLeft.toString(),
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //  height: MediaQuery.of(context).size.height * 0.2,
              color: Colors.grey.shade900,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      //    width: MediaQuery.of(context).size.width * 0.86,
                      child: TextField(
                        onTap: () {
                          setState(() {
                            editing = true;
                          });
                        },
                        controller: txtPhone,
                        onChanged: (v) {
                          updateChars();
                        },
                        maxLines: 1,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.grey.shade300,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone',
                          hintStyle: GoogleFonts.roboto(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade700,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
