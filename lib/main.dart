import 'package:bybug/page/desktop/pages/comingsoon.dart';
import 'package:bybug/page/desktop/pages/home.dart';
import 'package:bybug/page/desktop/shop/shop.dart';
import 'package:bybug/private/add_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: Scaffold(
        body: LayoutBuilder(
          builder: (p0, p1) {
            // return p1.maxWidth > 600 ? const HomeBlog() : const HomePagePhone();
            return AddDataPage();
          },
        ),
      ),
    );
  }
}
