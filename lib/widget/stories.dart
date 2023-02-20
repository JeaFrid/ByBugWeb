import 'package:bybug/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Stories extends StatelessWidget {
  final BoxConstraints constraints;
  final String image;
  final String title;
  final String titleAlert;
  final String aboutAlert;
  final void Function()? onTap;
  const Stories({
    super.key,
    required this.constraints,
    required this.image,
    required this.title,
    required this.titleAlert,
    required this.aboutAlert,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap ??
              () {
                ByBugDialg.showStory(
                    context, constraints, titleAlert, aboutAlert);
              },
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: ClipOval(
              child: Image.network(
                image,
                height: 75,
                width: 75,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/storytime.jpg",
                    height: 75,
                    width: 75,
                  );
                },
              ),
            ),
          ),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
