import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerWidget extends StatelessWidget {
  BoxConstraints constraints;
  bool left;
  String image;
  String miniTitle;
  String title;
  String subtitle;
  BannerWidget({
    super.key,
    required this.constraints,
    required this.left,
    required this.image,
    required this.miniTitle,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return left
        ? Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: const Color(0xff1C2735),
              borderRadius: BorderRadius.circular(5),
            ),
            width: constraints.maxWidth - 170,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    image,
                    width: constraints.maxWidth / 4,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          miniTitle,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: const Color(0xff1C2735),
              borderRadius: BorderRadius.circular(5),
            ),
            width: constraints.maxWidth - 170,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          miniTitle,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    image,
                    width: constraints.maxWidth / 4,
                  ),
                ),
              ],
            ),
          );
  }
}
