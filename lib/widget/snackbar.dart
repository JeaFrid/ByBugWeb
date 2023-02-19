import 'package:flutter/material.dart';
import 'package:get/get.dart';

void sendMessage(title, subtitle) {
  Get.snackbar(
    title,
    subtitle,
    backgroundColor: Colors.black87,
    colorText: Colors.white,
    maxWidth: 300,
  );
}
