import 'package:bybug/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widget/product.dart';
import '../../../widget/shop_button.dart';
import '../../../widget/stories.dart';
import '../../../widget/textfield.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});
  final searchController = TextEditingController();
  final productScroll = ScrollController();
  final storyScroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors().backgroundColor,
        body: LayoutBuilder(
          builder: (p0, constraints) => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 20, left: 20),
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
                      storyScroll.jumpTo(storyScroll.offset - details.delta.dx);
                    },
                    child: SingleChildScrollView(
                      controller: storyScroll,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                          Stories(),
                        ],
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
                      children: [
                        AddProduct(
                            image:
                                "https://raw.githubusercontent.com/JeaFrid/LaviniaCode/main/AssetsGlobal/LaviniaLogo.jpg",
                            title: "ByBugTekno",
                            productType: "Dijital Ürün",
                            category: "Mobil Uygulama, Kaynak Kod",
                            price: "400₺",
                            discount: "Özel İndirim!"),
                        AddProduct(
                            image:
                                "https://raw.githubusercontent.com/JeaFrid/LaviniaCode/main/AssetsGlobal/LaviniaLogo.jpg",
                            title: "ByBugTekno",
                            productType: "Dijital Ürün",
                            category: "Mobil Uygulama, Kaynak Kod",
                            price: "400₺",
                            discount: "Özel İndirim!"),
                        AddProduct(
                            image:
                                "https://raw.githubusercontent.com/JeaFrid/LaviniaCode/main/AssetsGlobal/LaviniaLogo.jpg",
                            title: "ByBugTekno",
                            productType: "Dijital Ürün",
                            category: "Mobil Uygulama, Kaynak Kod",
                            price: "400₺",
                            discount: "Özel İndirim!"),
                        AddProduct(
                            image:
                                "https://raw.githubusercontent.com/JeaFrid/LaviniaCode/main/AssetsGlobal/LaviniaLogo.jpg",
                            title: "ByBugTekno",
                            productType: "Dijital Ürün",
                            category: "Mobil Uygulama, Kaynak Kod",
                            price: "400₺",
                            discount: "Özel İndirim!"),
                        AddProduct(
                            image:
                                "https://raw.githubusercontent.com/JeaFrid/LaviniaCode/main/AssetsGlobal/LaviniaLogo.jpg",
                            title: "ByBugTekno",
                            productType: "Dijital Ürün",
                            category: "Mobil Uygulama, Kaynak Kod",
                            price: "400₺",
                            discount: "Özel İndirim!"),
                        AddProduct(
                            image:
                                "https://raw.githubusercontent.com/JeaFrid/LaviniaCode/main/AssetsGlobal/LaviniaLogo.jpg",
                            title: "ByBugTekno",
                            productType: "Dijital Ürün",
                            category: "Mobil Uygulama, Kaynak Kod",
                            price: "400₺",
                            discount: "Özel İndirim!"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
