import 'package:bybug/skeleton.dart';
import 'package:bybug/theme/color.dart';
import 'package:bybug/utils/color_utils.dart';
import 'package:bybug/widget/button.dart';
import 'package:bybug/widget/dialog.dart';
import 'package:bybug/widget/icon_title_text.dart';
import 'package:bybug/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_selectable_text/custom_selectable_text.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorConverter extends StatelessWidget {
  ColorConverter({super.key});

  ///TextField Controller
  final colorController = TextEditingController();

  ///Rx Veriables
  RxString colorValue = "#ffffff".obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors().backgroundColor,
        body: LayoutBuilder(
          builder: (p0, p1) {
            return Skeleton(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "ByBugWeb Renk Dönüştürücü",
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
                  ),
                  SizedBox(
                    width: p1.maxWidth / 2,
                    child: CustomTextField(
                      textfieldController: colorController,
                      labelText: "Renk Değeri",
                      type: 1,
                    ),
                  ),
                  SizedBox(
                    width: p1.maxWidth / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTitleText(
                            event: () {
                              ByBugDialg.info(
                                context,
                                p1,
                                "Nasıl Kullanılır?",
                                "Renk değerine hex tipinde bir renk kodu vererek, çıktı almak istediğiniz tipe dönüştürebilirsiniz.",
                              );
                            },
                            title: "Nasıl Kullanılır?",
                            subtitle:
                                "Renk değerine hex tipinde bir renk kodu vererek, çıktı almak istediğiniz tipe dönüştürebilirsiniz.",
                            icon: Icons.help_center),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => CustomSelectableText(
                                colorValue.value,
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomButton(
                              title: "RGB'e Dönüştür",
                              event: () {
                                if (colorController.text.contains("#")) {
                                  colorValue.value =
                                      ColorUtils.hextoRgb(colorController.text);
                                } else {
                                  ByBugDialg.error(
                                      context,
                                      p1,
                                      "Hex Hatası Algılandı.",
                                      "Bir hex kodu vermelisiniz. Örnek: #ffffff");
                                }
                              },
                            ),
                            CustomButton(
                              title: "Num'a Dönüştür",
                              event: () {
                                if (colorController.text.contains("#")) {
                                  colorValue.value = ColorUtils.hextoNum(
                                      colorController.text.replaceAll("#", ""));
                                } else {
                                  ByBugDialg.error(
                                      context,
                                      p1,
                                      "Hex Hatası Algılandı.",
                                      "Bir hex kodu vermelisiniz. Örnek: #ffffff");
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
