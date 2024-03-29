import 'package:bybug/page/auth/register.dart';
import 'package:bybug/services/firebase_editor.dart';
import 'package:bybug/theme/color.dart';
import 'package:bybug/widget/button.dart';
import 'package:bybug/widget/dialog.dart';
import 'package:bybug/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../locale/profile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors().backgroundColor,
      body: LayoutBuilder(
        builder: (p0, p1) {
          return p1.maxWidth > 900 ? pc() : mobile();
        },
      ),
    );
  }

  Scaffold pc() {
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
                        width: constraints.maxWidth / 2,
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
                                        Navigator.pushNamed(
                                            context, "/register");
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
                                      ? Navigator.of(context)
                                          .pushNamed("/profile")
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
                                  Navigator.of(context).pop();
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

  Scaffold mobile() {
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
                      width: constraints.maxWidth - 100,
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
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: constraints.maxWidth / 2,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            color: const Color.fromARGB(10, 255, 255, 255),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () async {
                                List status = await FirebaseEditor.login(
                                    emailController.text,
                                    passwordController.text);
                                status[0] == 1
                                    ? Navigator.of(context)
                                        .pushNamed("/profile")
                                    // ignore: use_build_context_synchronously
                                    : ByBugDialg.error(
                                        context,
                                        constraints,
                                        "Giriş Başarısız!",
                                        status[1].toString());
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Text(
                                  "Giriş Yap",
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth / 2,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            color: const Color.fromARGB(10, 255, 255, 255),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/register");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Text(
                                  "Hesap Oluşturun!",
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  "Eve Dön",
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.policy),
      ),
    );
  }
}
