import 'package:bybug/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreWidget extends StatelessWidget {
  String scoreText;
  String score;
  Color? color;
  double? padding;
  double? margin;

  ScoreWidget({
    super.key,
    required this.scoreText,
    required this.score,
    this.padding,
    this.color,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: color ?? ThemeColors().lightColor,
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: ThemeColors().lightColor,
        ),
      ),
      margin: EdgeInsets.all(margin ?? 10),
      padding: EdgeInsets.all(padding ?? 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 8.0, bottom: 2),
            child: Text(
              score,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Text(
              scoreText,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
