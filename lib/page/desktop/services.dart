import 'package:flutter/material.dart';
import '../../theme/color.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors().backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [],
          );
        },
      ),
    );
  }
}
