import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../page/shop/content.dart';

class AddProduct extends StatelessWidget {
  final String? image;
  final String title;
  final String description;
  final String productType;
  final String price;

  final String downloadLink;

  const AddProduct({
    super.key,
    this.image,
    required this.title,
    required this.productType,
    required this.description,
    required this.price,
    required this.downloadLink,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image ?? "",
                width: 250,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/product.jpg",
                    width: 250,
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 29, 29, 22),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    productType,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 29, 29, 22),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Dijital Ürün!",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),
        InkWell(
          onTap: () {
            Get.to(ShopContent(
                title: title,
                productType: productType,
                downloadLink: downloadLink,
                description: description));
          },
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin:
                const EdgeInsets.only(bottom: 20, top: 5, left: 20, right: 20),
            width: 250,
            //height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 29, 29, 22),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: GoogleFonts.sarabun(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.sarabun(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Ücretsiz",
                        style: GoogleFonts.sarabun(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
