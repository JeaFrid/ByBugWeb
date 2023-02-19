import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: ClipOval(
              child: Image.network(
                "https://raw.githubusercontent.com/JeaFrid/LaviniaCode/main/AssetsGlobal/LaviniaLogo.jpg",
                height: 75,
                width: 75,
              ),
            ),
          ),
        ),
        Text(
          "Eklentiler",
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
