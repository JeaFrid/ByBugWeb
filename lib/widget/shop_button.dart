import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCustomButton extends StatelessWidget {
  final IconData icon;
  final String text;

  final void Function() function;

  const AddCustomButton({
    super.key,
    required this.icon,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: function,
        //hoverColor: ProjectColors().buttonBackgroundColor,
        //focusColor: ProjectColors().buttonBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.white, size: 10),
                  const SizedBox(width: 5),
                  Text(
                    text,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddCustomButtonAsync extends StatelessWidget {
  final IconData icon;
  final String text;

  final Future<void> Function() futureFunction;

  const AddCustomButtonAsync({
    super.key,
    required this.icon,
    required this.text,
    required this.futureFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: futureFunction,
        // hoverColor: ProjectColors().buttonBackgroundColor,
        //focusColor: ProjectColors().buttonBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.white, size: 10),
                  const SizedBox(width: 5),
                  Text(
                    text,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
