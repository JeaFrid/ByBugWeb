import 'package:bybug/page/desktop/fast_order.dart';
import 'package:bybug/page/desktop/home.dart';
import 'package:bybug/page/phone/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ByBugWeb!',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(body: LayoutBuilder(
        builder: (p0, p1) {
          return p1.maxWidth > 600
              ? const HomePageDesktop()
              : const HomePagePhone();
        },
      )),
    );
  }
}
