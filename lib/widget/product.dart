import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProduct extends StatelessWidget {
  String image = "";
  String title = "";
  String category = "";
  String productType = "";
  String price = "";
  String discount = "";
  String downloadLink = "";

  AddProduct({
    super.key,
    required this.image,
    required this.title,
    required this.productType,
    required this.category,
    required this.price,
    required this.discount,
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
                image,
                width: 250,
              ),
            ),
            Column(
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
                    discount,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 4),
        Container(
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
                category,
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
                      price,
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
      ],
    );
  }
}
