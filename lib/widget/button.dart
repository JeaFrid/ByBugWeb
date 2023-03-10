import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? event;
  final void Function()? onLongPress;
  const CustomButton({
    super.key,
    required this.title,
    this.event,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: event ?? () {},
      onLongPress: onLongPress ?? () {},
      hoverColor: ThemeColors().focusColor,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        margin: const EdgeInsets.all(5),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
