import 'package:chittter_chatter_app/interface/utils/resuable_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChartView extends StatelessWidget {
  const ChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: (() => Get.back()),
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
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Username",
                    style: GoogleFonts.roboto(
                      color: Colors.grey.shade300,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "last seen today at 01:50s",
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
              Column(
                children: [const Text('data')],
              ),
              SizedBox(
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
                          minLines: 1,
                          maxLines: null,
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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic_outlined,
                        color: primaryColor1,
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
}
