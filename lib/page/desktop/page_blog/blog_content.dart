import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/get_blog.dart';
import '../../../skeleton.dart';
import '../../../theme/color.dart';
import '../../../widget/blog.dart';

class BlogContent extends StatefulWidget {
  String tag = "";
  BlogContent({
    super.key,
    required this.tag,
  });

  @override
  State<BlogContent> createState() => _BlogContentState();
}

class _BlogContentState extends State<BlogContent> {
  final RxList content = [].obs;
  final RxBool isLoading = false.obs;

  Future<void> getBlog() async {
    content.value = await Blog.getBlogContent(widget.tag);
    isLoading.value = true;
  }

  @override
  void initState() {
    super.initState();
    getBlog();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return isLoading.value == false
          ? Scaffold(
              backgroundColor: ThemeColors().backgroundColor,
              body: const Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              ),
            )
          : Scaffold(
              backgroundColor: ThemeColors().backgroundColor,
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return Skeleton(
                    title: "ByBug Blog!",
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BlogWidget(
                                constraints: constraints,
                                topTitle: content[1],
                                title: content[2],
                                subtitle: content[3],
                                image: content[4],
                                buttonText: content[6],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => Text(
                                      content[5],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth < 750
                                            ? 14
                                            : constraints.maxWidth < 950
                                                ? 14
                                                : 16,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
    });
  }
}
