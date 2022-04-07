import 'package:chittter_chatter_app/interface/tabs/calls_tab.dart';
import 'package:chittter_chatter_app/interface/tabs/camera_tab.dart';
import 'package:chittter_chatter_app/interface/tabs/chats_tab.dart';
import 'package:chittter_chatter_app/interface/tabs/settings_tab.dart';
import 'package:chittter_chatter_app/interface/tabs/status_tab.dart';
import 'package:chittter_chatter_app/interface/utils/resuable_const.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _tabController.animateTo(3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: SizedBox(
          height: 60,
          child: TabBar(
            controller: _tabController,
            labelColor: primaryColor1,
            unselectedLabelColor: Colors.grey.shade500,
            labelPadding: EdgeInsets.zero,
            indicatorColor: Colors.transparent,
            tabs: const [
              Tab(
                icon: Icon(FontAwesome.spinner),
                text: 'Status',
              ),
              Tab(
                icon: Icon(Icons.phone_outlined),
                text: 'Calls',
              ),
              Tab(
                icon: Icon(Icons.camera_alt_outlined),
                text: 'Camera',
              ),
              Tab(
                icon: Icon(FontAwesome.chat_empty),
                text: 'Chats',
              ),
              Tab(
                icon: Icon(Icons.settings_outlined),
                text: 'Settings',
              ),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(controller: _tabController, children: const [
            Status(),
            Calls(),
            Camera(),
            Chats(),
            Settings(),
          ]),
        ),
      ),
    );
  }
}
