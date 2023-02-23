import 'package:bybug/page/blog/blog_add.dart';
import 'package:bybug/page/locale/home.dart';
import 'package:bybug/services/firebase_editor.dart';
import 'package:bybug/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../skeleton.dart';
import '../../../theme/color.dart';
import '../../../widget/icon_title_text.dart';
import '../../../widget/loading.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final RxBool isLoading = true.obs;

  RxString profilePhoto = "".obs;

  final RxString name = "".obs;

  final RxString date = "".obs;

  final RxString email = "".obs;

  final RxString country = "".obs;

  Future<void> getProfileInit() async {
    List gotList = await FirebaseEditor.getProfile();

    profilePhoto.value = gotList[1].toString().replaceAll(" ", "");
    name.value = gotList[2];
    date.value = gotList[5].toString().split(" ")[1].replaceAll("-", "/");
    email.value = gotList[3];
    country.value = gotList[6];
    isLoading.value = false;
  }

  @override
  void initState() {
    super.initState();
    getProfileInit();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ThemeColors().backgroundColor,
        body: isLoading.value == true
            ? const LoadingWidget()
            : LayoutBuilder(
                builder: (context, constraints) {
                  return Skeleton(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: constraints.maxWidth / 4,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipOval(
                                      child: Obx(
                                        () => Image.network(
                                          profilePhoto.value,
                                          width: constraints.maxWidth / 5,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                "assets/images/logo-classic.png");
                                          },
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        name.value,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        country.value,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        date.value,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    CustomButton(
                                      title: "Çıkış Yap",
                                      event: () {
                                        FirebaseEditor.logout();
                                        Get.offAll(const HomePage());
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Wrap(
                                children: [
                                  IconTitleText(
                                    title: "Eve Dön",
                                    subtitle:
                                        "ByBug'ın ana sayfasına hızlı bir gidiş yolu!",
                                    icon: Icons.home,
                                    event: () => Get.to(const HomePage()),
                                  ),
                                  IconTitleText(
                                    title: "Blog Yaz!",
                                    event: () => Get.to(const BlogAdd()),
                                    subtitle:
                                        "ByBug Blog'a bir blog yazısı bırakmak için bu modülü kullanabilirsiniz.",
                                    icon: Icons.text_snippet,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
/**isLoading.value == true
            ? const LoadingWidget()
            : */