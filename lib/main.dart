import 'package:bybug/page/auth/login.dart';
import 'package:bybug/page/auth/register.dart';
import 'package:bybug/page/blog/blog.dart';
import 'package:bybug/page/blog/blog_add.dart';
import 'package:bybug/page/extra/mobile_mobile.dart';
import 'package:bybug/page/locale/color.dart';
import 'package:bybug/page/locale/comingsoon.dart';
import 'package:bybug/page/locale/home.dart';
import 'package:bybug/page/locale/profile.dart';
import 'package:bybug/page/shop/shop.dart';
import 'package:bybug/private/add_data.dart';
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
      routes: {
        "/home": (x) => const HomePage(),
        "/login": (x) => LoginPage(),
        "/admin": (x) => AddDataPage(),
        "/menu": (x) => const MobileMenu(),
        "/register": (x) => RegisterPage(),
        "/profile": (x) => const ProfilePage(),
        "/blog": (x) => const HomeBlog(),
        "/blog/add": (x) => const BlogAdd(),
        "/comingsoon": (x) => const ComingSoon(),
        "/shop": (x) => const ShopPage(),
        "/utils/color-conventer": (x) => ColorConverter(),
      },
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
