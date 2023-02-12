import 'package:flutter/material.dart';

import '../page/desktop/page-blog/blog-add.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final textfieldController;
  const CustomTextField({
    super.key,
    required this.textfieldController,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: textfieldController,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white30),
          labelText: labelText,
          hintText: labelText,
          labelStyle: const TextStyle(color: Colors.white70),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.white70),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide:
                BorderSide(width: 1, color: Color.fromARGB(255, 105, 105, 105)),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
