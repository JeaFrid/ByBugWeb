import 'package:bybug/page/desktop/home.dart';
import 'package:bybug/page/desktop/page-blog/blog-add.dart';
import 'package:bybug/page/desktop/page-blog/home.dart';
import 'package:bybug/utils/random_generator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bybug/page/phone/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          // return p1.maxWidth > 600 ? const HomeBlog() : const HomePagePhone();
          return const HomePageDesktop();
        },
      )),
    );
  }
}
