import 'package:bybug/skeleton.dart';
import 'package:bybug/theme/color.dart';
import 'package:bybug/widget/blog.dart';
import 'package:flutter/material.dart';

class HomeBlog extends StatelessWidget {
  const HomeBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors().backgroundColor,
      body: Skeleton(
        title: "ByBug Blog",
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlogWidget(
                    constraints: constraints,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
