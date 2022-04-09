import 'package:chittter_chatter_app/interface/pages/account_infor.dart';
import 'package:chittter_chatter_app/interface/pages/chart_view.dart';
import 'package:chittter_chatter_app/interface/pages/contacts.dart';
import 'package:chittter_chatter_app/interface/pages/splash.dart';
import 'package:chittter_chatter_app/state/bindings/bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'interface/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binder(),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => Splash()),
        GetPage(name: '/home', page: () => const Home()),
        GetPage(name: '/chatView', page: () => const ChartView()),
        GetPage(name: '/accountinfo', page: () => AccountInfo()),
        GetPage(name: '/contacts', page: () => const Contacts()),
      ],
    );
  }
}
