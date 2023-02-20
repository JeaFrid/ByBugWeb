import 'package:bybug/services/firebase_editor.dart';
import 'package:bybug/theme/color.dart';
import 'package:bybug/widget/button.dart';
import 'package:bybug/widget/dialog.dart';
import 'package:bybug/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../web/auth/register.dart';
import '../../web/locale/profile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors().backgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset("assets/images/logo-space.png",
                            width: 100),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "ByBugWeb'e Giriş Yap!",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Software&Development",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: constraints.maxWidth / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextField(
                                type: 3,
                                textfieldController: emailController,
                                labelText: "E-posta"),
                            CustomTextField(
                              type: 2,
                              textfieldController: passwordController,
                              labelText: "Parola",
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      borderRadius: BorderRadius.circular(5),
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(Icons.policy,
                                                  color: Colors.white70,
                                                  size: 18),
                                            ),
                                            Text(
                                              "Gizlilik Sözleşmesi",
                                              style: GoogleFonts.openSans(
                                                fontSize: 14,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(5),
                                      onTap: () {
                                        Get.to(
                                          RegisterPage(),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Hesap Oluşturun!",
                                              style: GoogleFonts.openSans(
                                                fontSize: 14,
                                                color: Colors.white70,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(Icons.arrow_forward,
                                                  color: Colors.white70,
                                                  size: 18),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: CustomButton(
                                title: "Giriş Yap",
                                event: () async {
                                  List status = await FirebaseEditor.login(
                                      emailController.text,
                                      passwordController.text);
                                  status[0] == 1
                                      ? Get.offAll(const ProfilePage())
                                      // ignore: use_build_context_synchronously
                                      : ByBugDialg.error(
                                          context,
                                          constraints,
                                          "Giriş Başarısız!",
                                          status[1].toString());
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5),
                                onTap: () {
                                  Get.back();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.home,
                                            color: Colors.white70, size: 18),
                                      ),
                                      Text(
                                        "Eve Dön",
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            );
          },
        ));
  }
}
