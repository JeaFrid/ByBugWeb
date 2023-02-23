import 'package:bybug/page/auth/login.dart';
import 'package:bybug/page/auth/register.dart';
import 'package:bybug/page/locale/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'services/firebase_options.dart';

Future<void> main() async {
  usePathUrlStrategy();
  const BrowserPlatformLocation();
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
            return const HomePage();
          },
        ),
      ),
    );
  }
}
