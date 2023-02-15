
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
  var scrollView = ScrollController();
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
                                          "ByBug Hızlı Sipariş Platformu",
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
                                  "ByBug Hızlı Sipariş Platformuna hoşgeldiniz! Burada projenizi renklendirmek için size hizmet veriyoruz. Teknolojiye senaryo yazmaya hazır mısın? Hadi metin kutularını doldurmaya başla ve projeni birlikte hayata geçirelim!",
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
                                    type: TextInputType.multiline,
                                    textfieldController: projeAdi,
                                    labelText: "Proje Adı / Uygulama Adı"),
                                CustomTextField(
                                    type: TextInputType.multiline,
                                    textfieldController: sektorAdi,
                                    labelText: "Projenin Hitap Ettiği Sektör"),
                                CustomTextField(
                                    type: TextInputType.multiline,
                                    textfieldController: projeDetaylari,
                                    labelText: "Proje Detayları"),
                                CustomTextField(
                                    type: TextInputType.multiline,
                                    textfieldController: ortalamaButce,
                                    labelText: "Ortalama Bütçe"),
                                CustomTextField(
                                    type: TextInputType.multiline,
                                    textfieldController: eposta,
                                    labelText: "E-posta Adresi"),
                                CustomTextField(
                                    type: TextInputType.multiline,
                                    textfieldController: telegram,
                                    labelText: "Telegram Adresi"),
                                Row(
                                  children: [
                                    CustomButton(title: "Bize Ulaş"),
                                    const SizedBox(width: 20),
                                    CustomButton(
                                        title: "Sipariş Sepeti Oluştur"),
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
