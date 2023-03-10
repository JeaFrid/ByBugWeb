import 'package:bybug/theme/color.dart';
import 'package:bybug/widget/button.dart';
import 'package:bybug/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FastOrder extends StatelessWidget {
  FastOrder({super.key});
  final projeAdi = TextEditingController();
  final sektorAdi = TextEditingController();
  final projeDetaylari = TextEditingController();
  final ortalamaButce = TextEditingController();
  final eposta = TextEditingController();
  final telegram = TextEditingController();
  final scrollView = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors().backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Card(
              elevation: 5.0,
              color: const Color.fromARGB(255, 13, 18, 31),
              child: Center(
                child: SizedBox(
                  width: constraints.maxWidth - 100,
                  height: constraints.maxHeight - 100,
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      scrollView.jumpTo(scrollView.offset - details.delta.dy);
                    },
                    child: SingleChildScrollView(
                      controller: scrollView,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, top: 30, bottom: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      borderRadius: BorderRadius.circular(10),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Icon(Icons.arrow_back,
                                            color: Colors.white, size: 30),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "ByBug H??zl?? Sipari?? Platformu",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "ByBug H??zl?? Sipari?? Platformuna ho??geldiniz! Burada projenizi renklendirmek i??in size hizmet veriyoruz. Teknolojiye senaryo yazmaya haz??r m??s??n? Hadi metin kutular??n?? doldurmaya ba??la ve projeni birlikte hayata ge??irelim!",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.white70,
                                    //fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                CustomTextField(
                                    type: 1,
                                    textfieldController: projeAdi,
                                    labelText: "Proje Ad?? / Uygulama Ad??"),
                                CustomTextField(
                                    type: 1,
                                    textfieldController: sektorAdi,
                                    labelText: "Projenin Hitap Etti??i Sekt??r"),
                                CustomTextField(
                                    type: 1,
                                    textfieldController: projeDetaylari,
                                    labelText: "Proje Detaylar??"),
                                CustomTextField(
                                    type: 1,
                                    textfieldController: ortalamaButce,
                                    labelText: "Ortalama B??t??e"),
                                CustomTextField(
                                    type: 1,
                                    textfieldController: eposta,
                                    labelText: "E-posta Adresi"),
                                CustomTextField(
                                    type: 1,
                                    textfieldController: telegram,
                                    labelText: "Telegram Adresi"),
                                Row(
                                  children: const [
                                    CustomButton(title: "Bize Ula??"),
                                    SizedBox(width: 20),
                                    CustomButton(
                                        title: "Sipari?? Sepeti Olu??tur"),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
