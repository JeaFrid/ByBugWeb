import 'package:bybug/page/auth/login.dart';
import 'package:bybug/page/blog/blog_add.dart';
import 'package:bybug/services/firebase_editor.dart';
import 'package:bybug/services/get_blog.dart';
import 'package:bybug/skeleton.dart';
import 'package:bybug/theme/color.dart';
import 'package:bybug/widget/blog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBlog extends StatefulWidget {
  const HomeBlog({super.key});

  @override
  State<HomeBlog> createState() => _HomeBlogState();
}

class _HomeBlogState extends State<HomeBlog> {
  bool isSing = false;
  final homeScrollController = ScrollController();
  RxList blogList = [].obs;
  RxString status = "Yükleniyor...".obs;
  Future<void> getBlog() async {
    blogList.value = await Blog.getOnce();
    status.value = "Yüklendi.";
    isSing = FirebaseEditor.isSignedIn();
  }

  @override
  void initState() {
    super.initState();
    getBlog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors().backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Skeleton(
            title: "ByBug Blog",
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: Obx(
                      () => GestureDetector(
                        onVerticalDragUpdate: (details) {
                          homeScrollController.jumpTo(
                              homeScrollController.offset - details.delta.dy);
                        },
                        child: ListView.builder(
                          controller: homeScrollController,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemCount: blogList.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: BlogWidget(
                                constraints: constraints,
                                goToLink: blogList[index][7],
                                title: blogList[index][2],
                                subtitle: blogList[index][3],
                                image: blogList[index][4],
                                buttonText: blogList[index][6],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50)
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isSing
              ? Navigator.of(context).pushNamed("/blog/add")
              : Navigator.of(context).pushNamed("/login");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
