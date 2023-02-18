import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogWidget extends StatelessWidget {
  final void Function()? event;
  final BoxConstraints constraints;
  final String? buttonText;
  final String? image;
  final String? topTitle;
  final String? title;
  final String? subtitle;
  final String? goToLink;

  const BlogWidget({
    super.key,
    required this.constraints,
    this.event,
    this.image,
    this.buttonText,
    this.goToLink,
    this.subtitle,
    this.title,
    this.topTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth - constraints.maxWidth / 6,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                image ??
                    "https://raw.githubusercontent.com/JeaFrid/ByBugWeb/master/assets/images/logo-classic.png",
                width: constraints.maxWidth / 2 - constraints.maxWidth / 6,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    "https://raw.githubusercontent.com/JeaFrid/ByBugWeb/master/assets/images/logo-classic.png",
                    width: constraints.maxWidth / 2 - constraints.maxWidth / 6,
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    topTitle ?? "???",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      fontSize: constraints.maxWidth < 750
                          ? 12
                          : constraints.maxWidth < 950
                              ? 14
                              : 16,
                      color: const Color.fromARGB(255, 254, 232, 207),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title ?? "???",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.pacifico(
                      fontSize: constraints.maxWidth < 750
                          ? 25
                          : constraints.maxWidth < 950
                              ? 35
                              : 40,
                      color: const Color(0xffB36307),
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    subtitle ?? "???",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      fontSize: constraints.maxWidth < 750
                          ? 10
                          : constraints.maxWidth < 950
                              ? 12
                              : 14,
                      color: const Color.fromARGB(173, 255, 255, 255),
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: event ?? () {},
                    hoverColor: Colors.transparent,
                    splashColor: const Color.fromARGB(5, 255, 255, 255),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 16),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xffB36307), width: 2)),
                      child: Text(
                        buttonText ?? "Devamını oku...",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color(0xffB36307),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
