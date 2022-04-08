import 'package:chittter_chatter_app/interface/utils/resuable_const.dart';
import 'package:chittter_chatter_app/interface/widgets/char_card.dart';
import 'package:chittter_chatter_app/state/controllers/chats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(
        () => CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.23,
            toolbarHeight: 40,
            backgroundColor: Colors.black,
            pinned: true,
            leading: TextButton(
              onPressed: () {
                var p = Get.find<ChatRoom>();
                p.ch.add("new name");
              },
              child: Text(
                "Edit",
                style: GoogleFonts.roboto(
                  color: primaryColor1,
                  fontSize: 17,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => Get.toNamed('/contacts'),
                icon: const Icon(
                  LineAwesomeIcons.edit,
                  color: primaryColor1,
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Chats',
                      style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.grey.shade700,
                              size: 23,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Search",
                              style: GoogleFonts.roboto(
                                color: Colors.grey.shade700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Broadcast Lists",
                          style: GoogleFonts.roboto(
                            color: primaryColor1,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "New Groups",
                          style: GoogleFonts.roboto(
                            color: primaryColor1,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          sliverWidgets(),
        ]),
      ),
    );
  }

  sliverWidgets() {
    var chatroomController = Get.find<ChatRoom>();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const ChatCard(),
        childCount: chatroomController.chats.length,
      ),
    );
  }
}
