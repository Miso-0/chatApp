import 'package:chittter_chatter_app/interface/pages/account_infor.dart';
import 'package:chittter_chatter_app/interface/pages/chart_view.dart';
import 'package:chittter_chatter_app/logic/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'interface/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  Hive.registerAdapter(ChatAdapter());
  await Hive.openBox<Chat>("ChatBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const Home()),
        GetPage(name: '/chatView', page: () => const ChartView()),
        GetPage(name: '/accountinfo', page: () => AccountInfo()),
      ],
    );
  }
}
