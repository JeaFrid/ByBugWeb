import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page/desktop/home.dart';
import 'theme/color.dart';
import 'widget/button.dart';

class Skeleton extends StatelessWidget {
  Widget child;
  String? title;
  Skeleton({
    super.key,
    required this.child,
    this.title,
  });
  final homeScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
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
                          title ?? "ByBugWeb!",
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
                          title: "Ev",
                          event: () => Get.offAll(HomePageDesktop()),
                        ),
                        CustomButton(
                          title: "Market",
                          event: () => Get.offAll(HomePageDesktop()),
                        ),
                        CustomButton(
                          title: "Bize Ulaş",
                          event: () => Get.offAll(HomePageDesktop()),
                        ),
                        CustomButton(
                          title: "Hakkımızda",
                          event: () => Get.offAll(HomePageDesktop()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
    ;
  }
}
