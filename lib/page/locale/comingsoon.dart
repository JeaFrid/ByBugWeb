import 'package:bybug/skeleton.dart';
import 'package:bybug/theme/color.dart';
import 'package:bybug/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors().backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Skeleton(
            title: "Çok Yakında!",
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  const FaIcon(FontAwesomeIcons.locationDot,
                      color: Colors.white, size: 50),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Gelecekten geldiğin çok belli!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth / 2,
                    child: Text(
                      "Çünkü burası daha yapılmadı. Evet, gerçekten yapılmadı. Kodlanmadı yani. Baksana, bomboş bir sayfa. Seni karşılamak için geldim. Ben de gelmesem boş, mavimsi siyah bir arayüze bakıyor olacaktın. Aşağıda sana bir buton bırakıyorum. Oraya tıklayarak bir önceki sayfaya gidebilirsin. Hadi hoşça kal!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    title: "Eve Dön!",
                    event: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
