import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconTitleText extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final void Function()? event;

  const IconTitleText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: event ?? () {},
        hoverColor: const Color(0xff1C2735),
        child: Container(
            //margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white24,
              ),
              // color: const Color(0xff1C2735),
              borderRadius: BorderRadius.circular(8),
            ),
            width: 150,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 25,
                ),
                const SizedBox(height: 13),
                Text(
                  title,
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
