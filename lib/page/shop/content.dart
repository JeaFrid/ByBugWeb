// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:bybug/theme/color.dart';
import 'package:bybug/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;

class ShopContent extends StatelessWidget {
  ShopContent(
      {super.key,
      required this.title,
      required this.productType,
      required this.downloadLink,
      required this.description});

  ///Scroll Controllers
  final ScrollController mainScrollController = ScrollController();

  ///Veriables

  final String title;
  final String description;
  final String productType;
  final String downloadLink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors().backgroundColor,
        body: GestureDetector(
          onVerticalDragUpdate: (details) {
            mainScrollController
                .jumpTo(mainScrollController.offset - details.delta.dy);
          },
          child: SingleChildScrollView(
            controller: mainScrollController,
            child: LayoutBuilder(
              builder: (p0, p1) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/productcontent.jpg",
                          width: p1.maxWidth,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: p1.maxWidth,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ThemeColors().backgroundColor,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: p1.maxWidth / 3 + 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomButton(
                                title: "İndir",
                                event: () => js.context
                                    .callMethod("open", [downloadLink]),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.computer_rounded,
                                color: Colors.white70,
                                size: 25,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                productType,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.description,
                                color: Colors.white70,
                                size: 25,
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: p1.maxWidth - 100,
                                child: Text(
                                  description,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 20,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.attach_money,
                                color: Colors.white70,
                                size: 25,
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: p1.maxWidth - 100,
                                child: Text(
                                  "Ücretsiz",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "ByBug | 2023",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.white60,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "E-Posta: bybugofficial@gmail.com\nByBug'ın Tüm Hakları Saklıdır.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
