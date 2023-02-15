import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/color.dart';
import '../../../services/firebase_editor.dart';
import '../../../utils/random_generator.dart';
import '../../../widget/button.dart';

final toptitle = TextEditingController();
final title = TextEditingController();
final subtitle = TextEditingController();
final image = TextEditingController();
final content = TextEditingController();
final buttonText = TextEditingController();
final scrollView = ScrollController();

RxString toptitleRx = "Merhaba, ByBug Blog!".obs;
RxString titleRx = "ByBug Blog'un Işıltılı Bir Başlığı!".obs;
RxString subtitleRx = "Bu açıklama, oldukça uzun olabilir mi?".obs;
RxString imageRx =
    "https://raw.githubusercontent.com/JeaFrid/ByBugWeb/master/assets/images/logo-classic.png"
        .obs;
RxString contentRx = "".obs;
RxString buttonTextRx = "Daha fazla...".obs;

class BlogAdd extends StatelessWidget {
  BlogAdd({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    toptitleRx.value = toptitle.text;
    titleRx.value = title.text;
    subtitleRx.value = subtitle.text;
    imageRx.value = image.text;
    contentRx.value = content.text;
    buttonTextRx.value = buttonText.text;
*/
    return Scaffold(
      backgroundColor: ThemeColors().backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                    width: constraints.maxWidth / 2,
                    child: LayoutBuilder(
                      builder: (p0, p1) {
                        return Obx(
                          () => Container(
                            width: p1.maxWidth - p1.maxWidth / 6,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.network(
                                          "https://raw.githubusercontent.com/JeaFrid/ByBugWeb/master/assets/images/logo-classic.png",
                                          width:
                                              p1.maxWidth / 2 - p1.maxWidth / 6,
                                        );
                                      },
                                      imageRx.value,
                                      width: p1.maxWidth / 2 - p1.maxWidth / 6,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          toptitleRx.value,
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.lato(
                                            fontSize: p1.maxWidth < 750
                                                ? 12
                                                : p1.maxWidth < 950
                                                    ? 14
                                                    : 16,
                                            color: const Color.fromARGB(
                                                255, 254, 232, 207),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          titleRx.value,
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.pacifico(
                                            fontSize: p1.maxWidth < 750
                                                ? 25
                                                : p1.maxWidth < 950
                                                    ? 35
                                                    : 40,
                                            color: const Color(0xffB36307),
                                            //fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          subtitleRx.value,
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.openSans(
                                            fontSize: p1.maxWidth < 750
                                                ? 10
                                                : p1.maxWidth < 950
                                                    ? 12
                                                    : 14,
                                            color: const Color.fromARGB(
                                                173, 255, 255, 255),
                                            //fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        InkWell(
                                          onTap: () {},
                                          hoverColor: Colors.transparent,
                                          splashColor: const Color.fromARGB(
                                              5, 255, 255, 255),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 16),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffB36307),
                                                    width: 2)),
                                            child: Text(
                                              buttonTextRx.value,
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                color: const Color(0xffB36307),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        );
                      },
                    )),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BlogAddCard(
                        scrollView: scrollView,
                        constraints: constraints,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BlogAddCard extends StatelessWidget {
  BlogAddCard({
    super.key,
    required this.scrollView,
    required this.constraints,
  });

  ScrollController scrollView;
  BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: const Color.fromARGB(255, 13, 18, 31),
      child: Center(
        child: SizedBox(
          width: constraints.maxWidth - 100,
          height: constraints.maxHeight - 100,
          child: GestureDetector(
              onVerticalDragUpdate: (details) {
                scrollView.jumpTo(scrollView.offset - details.delta.dy);
              },
              child: SingleChildScrollView(
                controller: scrollView,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, top: 30, bottom: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Icon(Icons.arrow_back,
                                      color: Colors.white, size: 30),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "Blog Oluştur!",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Yeni bir blog oluştururken, sol taraftan nasıl görüneceğini canlı olarak test edin.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white70,
                              //fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                onChanged: (value) {
                                  toptitleRx.value = value;
                                },
                                controller: toptitle,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 14),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white30),
                                  labelText: "Üst Başlık",
                                  hintText: "Üst Başlık",
                                  labelStyle: TextStyle(color: Colors.white70),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white70),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 105, 105, 105)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                onChanged: (value) {
                                  titleRx.value = value;
                                },
                                controller: title,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 14),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white30),
                                  labelText: "Başlık",
                                  hintText: "Başlık",
                                  labelStyle: TextStyle(color: Colors.white70),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white70),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 105, 105, 105)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                onChanged: (value) {
                                  subtitleRx.value = value;
                                },
                                controller: subtitle,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 14),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white30),
                                  labelText: "Alt Başlık",
                                  hintText: "Alt Başlık",
                                  labelStyle: TextStyle(color: Colors.white70),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white70),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 105, 105, 105)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                onChanged: (value) {
                                  imageRx.value = value;
                                },
                                controller: image,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 14),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white30),
                                  labelText: "Görsel",
                                  hintText: "Görsel",
                                  labelStyle: TextStyle(color: Colors.white70),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white70),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 105, 105, 105)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                onChanged: (value) {
                                  contentRx.value = value;
                                },
                                controller: content,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 14),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white30),
                                  labelText: "İçerik",
                                  hintText: "İçerik",
                                  labelStyle: TextStyle(color: Colors.white70),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white70),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 105, 105, 105)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                onChanged: (value) {
                                  buttonTextRx.value = value;
                                },
                                controller: buttonText,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 14),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white30),
                                  labelText: "Buton Yazısı",
                                  hintText: "Buton Yazısı",
                                  labelStyle: TextStyle(color: Colors.white70),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white70),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 105, 105, 105)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                CustomButton(title: "Hata Bildir"),
                                const SizedBox(width: 20),
                                CustomButton(
                                    title: "Paylaş",
                                    event: () async {
                                      FirebaseEditor.storeValue(
                                        "blog",
                                        JeaRandom.string(10),
                                        [
                                          toptitleRx.value,
                                          titleRx.value,
                                          subtitleRx.value,
                                          imageRx.value,
                                          contentRx.value,
                                          buttonTextRx.value,
                                        ],
                                      );
                                    }),
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
