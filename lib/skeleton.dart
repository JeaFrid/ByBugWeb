import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page/desktop/home.dart';
import 'theme/color.dart';
import 'widget/button.dart';

class Skeleton extends StatelessWidget {
  Widget child;
  Skeleton({super.key, required this.child});
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
                    Image.asset(
                      "/assets/images/logo-classic.png",
                      width: 100,
                      height: 100,
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
