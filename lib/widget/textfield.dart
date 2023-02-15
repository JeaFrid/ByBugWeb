import 'package:flutter/material.dart';

import '../page/desktop/page-blog/blog-add.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController textfieldController;
  final TextInputType? type;
  final bool? password;
  const CustomTextField({
    super.key,
    required this.textfieldController,
    required this.labelText,
    this.type,
    this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: textfieldController,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
        keyboardType: type ?? TextInputType.multiline,
        obscureText: password ?? false,
        maxLines: password == true ? 1 : null,
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
