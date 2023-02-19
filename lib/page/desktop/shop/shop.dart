import 'package:bybug/services/firebase_editor.dart';
import 'package:bybug/theme/color.dart';
import 'package:bybug/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widget/product.dart';
import '../../../widget/shop_button.dart';
import '../../../widget/stories.dart';
import '../../../widget/textfield.dart';

class ShopPage extends StatefulWidget {
  ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  ///Controllers
  final searchController = TextEditingController();
  final productScroll = ScrollController();
  final storyScroll = ScrollController();

  ///Rx Veriables
  RxList storyList = [].obs;
  RxBool status = false.obs;

  ///Get Stories Function
  Future<void> getData() async {
    //Value list, tag.
    // Example: [sdasd,asdasd,asdasd,asdasd,tag];
    storyList.value = await FirebaseEditor.getOnce("story");
    status.value = true;
  }

  ///initS
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors().backgroundColor,
        body: Obx(
          () => status.value == false
              ? const LoadingWidget()
              : LayoutBuilder(
                  builder: (p0, constraints) => SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, right: 20, left: 20),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "ByBug Dijital Market",
                                      style: GoogleFonts.poppins(
                                        color: Colors.white70,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  child: CustomTextField(
                                      textfieldController: searchController,
                                      labelText: "Ara",
                                      type: 1),
                                ),
                              ),
                              AddCustomButton(
                                icon: Icons.shopping_cart,
                                text: "Dijital Ürünler",
                                function: () {},
                              ),
                              AddCustomButton(
                                icon: Icons.android,
                                text: "Uygulama Mağazası",
                                function: () {},
                              ),
                              AddCustomButton(
                                icon: Icons.handyman,
                                text: "Yazılım Araçları",
                                function: () {},
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              storyScroll.jumpTo(
                                  storyScroll.offset - details.delta.dx);
                            },
                            child: SizedBox(
                              height: 150,
                              width: constraints.maxWidth - 100,
                              child: Obx(
                                () => ListView.builder(
                                  itemCount: storyList.length,
                                  controller: storyScroll,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Stories(
                                        constraints: constraints,
                                        image: storyList[index][1],
                                        title: storyList[index][2],
                                        titleAlert: storyList[index][3],
                                        aboutAlert: storyList[index][4]);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            productScroll.jumpTo(
                              productScroll.offset - details.delta.dx,
                            );
                          },
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: productScroll,
                            child: Row(
                              //alignment: WrapAlignment.spaceAround,
                              children: [],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
