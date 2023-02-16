import 'package:bybug/services/firebase_editor.dart';
import 'package:bybug/theme/color.dart';
import 'package:bybug/widget/button.dart';
import 'package:bybug/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  RxString ip = "".obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String nowTime =
      "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";

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
                            "ByBugWeb'e Kayıt Ol!",
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
                                type: 4,
                                textfieldController: nameController,
                                labelText: "Kullanıcı Adı"),
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
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(
                                () => Text(
                                  // "Kayıt olarak ByBug'ın Gizlilik Sözleşmesini kabul etmiş olursunuz.",
                                  ip.value,
                                  style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      borderRadius: BorderRadius.circular(5),
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(Icons.arrow_back,
                                                  color: Colors.white70,
                                                  size: 18),
                                            ),
                                            Text(
                                              "Giriş Yapın!",
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
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: CustomButton(title: "Kayıt Ol"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5),
                                onTap: () async {
                                  /* FirebaseEditor.register(
                                    emailController.text,
                                    passwordController.text,
                                    [
                                      nameController.text,
                                      emailController.text,
                                      passwordController.text,
                                    ],
                                  );
                                  final dio = Dio();
                                  final response =
                                      await dio.get('https://api.ipify.org/');
                                      
                                  ip.value = response.headers.toString();
                               */
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
