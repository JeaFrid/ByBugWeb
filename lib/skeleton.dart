import 'package:bybug/page/auth/login.dart';
import 'package:bybug/page/locale/home.dart';
import 'package:bybug/page/locale/profile.dart';
import 'package:bybug/private/add_data.dart';
import 'package:bybug/services/firebase_editor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'page/extra/mobile_mobile.dart';
import 'theme/color.dart';
import 'widget/button.dart';

class Skeleton extends StatefulWidget {
  final Widget child;
  final String? title;
  const Skeleton({
    super.key,
    required this.child,
    this.title,
  });

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  final homeScrollController = ScrollController();
  final RxBool status = true.obs;
  final RxString profilePhotos = "".obs;
  final bool isSign = FirebaseEditor.isSignedIn();
  Future<void> profileStatus() async {
    if (isSign) {
      final List profileList = await FirebaseEditor.getProfile();
      profilePhotos.value = profileList[1].toString().replaceAll(" ", "");
      status.value = false;
    } else {
      status.value = false;
    }
  }

  @override
  void initState() {
    super.initState();
    profileStatus();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        return p1.maxWidth > 900 ? pc(p1) : mobile(p1);
      },
    );
  }

  Scaffold pc(BoxConstraints p1) {
    return Scaffold(
      backgroundColor: ThemeColors().backgroundColor,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          homeScrollController
              .jumpTo(homeScrollController.offset - details.delta.dy);
        },
        child: SingleChildScrollView(
          controller: homeScrollController,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.title ?? "ByBugWeb!",
                          //p1.maxWidth.toString(),
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
                    Row(
                      children: [
                        CustomButton(
                          //  title: p1.maxWidth.toString(),
                          title: "ByBugWeb",
                          onLongPress: () {
                            String email =
                                FirebaseAuth.instance.currentUser == null
                                    ? "null@null.com"
                                    : FirebaseAuth.instance.currentUser!.email
                                        .toString();
                            if (email == "jeafriday@gmail.com") {
                              Get.to(AddDataPage());
                            } else {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                backgroundColor: ThemeColors().backgroundColor,
                                textColor: Colors.white,
                                titleColor: Colors.white,
                                confirmBtnColor: Colors.transparent,
                                title: "??zinsiz Giri??!",
                                confirmBtnText: "Tamam",
                                text:
                                    "Y??netici paneline girebilmek i??in ByBugWeb'de y??netici olmal??s??n??z.",
                              );
                            }
                          },
                          event: () => Get.offAll(
                            const HomePage(),
                          ),
                        ),
                        CustomButton(
                          title: "Market",
                          event: () => Get.offAll(const HomePage()),
                        ),
                        CustomButton(
                          title: "Bize Ula??",
                          event: () => Get.offAll(const HomePage()),
                        ),
                        CustomButton(
                          title: "Hakk??m??zda",
                          event: () => Get.offAll(const HomePage()),
                        ),
                        Obx(
                          () => SizedBox(
                            child: status.value == true
                                ? const SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                        color: Colors.white60, strokeWidth: 2),
                                  )
                                : isSign == false
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          onTap: () => Get.to(LoginPage()),
                                          hoverColor: const Color.fromARGB(
                                              255, 19, 24, 40),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.white70,
                                                width: 2,
                                              ),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 16),
                                            child: Text(
                                              "Giri?? Yap??n!",
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: InkWell(
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () =>
                                              Get.to(const ProfilePage()),
                                          child: Image.network(
                                            profilePhotos.value,
                                            width: 40,
                                            height: 40,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                "assets/images/logo-classic.png",
                                                width: 40,
                                                height: 40,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              widget.child
            ],
          ),
        ),
      ),
    );
  }

  Scaffold mobile(BoxConstraints p1) {
    return Scaffold(
      backgroundColor: ThemeColors().backgroundColor,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          homeScrollController
              .jumpTo(homeScrollController.offset - details.delta.dy);
        },
        child: SingleChildScrollView(
          controller: homeScrollController,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.to(const MobileMenu()),
                      borderRadius: BorderRadius.circular(5),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.menu, color: Colors.white, size: 25),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          widget.title ?? "ByBugWeb!",
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
                  ],
                ),
              ),
              widget.child
            ],
          ),
        ),
      ),
    );
  }
}
