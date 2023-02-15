import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../skeleton.dart';
import '../../../theme/color.dart';
import '../../../widget/icon_title_text.dart';

class ProfilePage extends StatelessWidget {
  final String? profilePhoto;
  const ProfilePage({
    super.key,
    this.profilePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors().backgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Skeleton(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth / 4,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: Image.network(
                                  profilePhoto ?? "",
                                  width: constraints.maxWidth / 5,
                                ),
                              ),
                              Text(
                                "JeaFriday",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Türkiye",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "15.02.2023",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          children: const [
                            IconTitleText(
                              title: "Blog Yaz!",
                              subtitle:
                                  "ByBug Blog'a bir blog yazısı bırakmak için bu modülü kullanabilirsiniz.",
                              icon: Icons.text_snippet,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
