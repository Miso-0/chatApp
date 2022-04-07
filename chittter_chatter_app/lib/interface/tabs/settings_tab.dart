// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chittter_chatter_app/interface/utils/resuable_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.of(context).size.height * 0.1,
            title: Text(
              "Settings",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            // flexibleSpace: FlexibleSpaceBar(
            //   title: Text(
            //     "Settings",
            //     style: GoogleFonts.roboto(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 23,
            //     ),
            //   ),
            // ),
          ),
          sliverWidgets(),
        ],
      ),
    );
  }

  sliverWidgets() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [AccountInformation(context: context)],
      ),
    );
  }
}

class AccountInformation extends StatelessWidget {
  const AccountInformation({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Get.toNamed('/accountinfo')),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          border: Border.all(
            color: Color.fromARGB(0, 71, 71, 71),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.shade400,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Username',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Text(
                        'user status',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.grey.shade300,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.qr_code,
                  color: primaryColor1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
