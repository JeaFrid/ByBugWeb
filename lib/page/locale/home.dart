import 'package:bybug/page/blog/blog.dart';
import 'package:bybug/page/locale/color.dart';
import 'package:bybug/page/locale/comingsoon.dart';
import 'package:bybug/widget/button.dart';
import 'package:bybug/widget/icon_title_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../skeleton.dart';
import '../../../theme/color.dart';
import '../shop/shop.dart';
import 'fast_order.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors().backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Skeleton(
            child: Column(
              children: [
                SizedBox(
                  width: constraints.maxWidth - 50,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Sadece Hayal Et,\nBiz Böyle Yaptık!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Teknolojinin yolunda ilerlerken,\nByBug'ı da bu serüveninize dahil edin.\nHemen teklif alın veya sipariş oluşturun!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white54,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.telegram,
                            color: Colors.white54,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.github,
                            color: Colors.white54,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.white54,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  title: "Teklif Al",
                  event: () {
                    Get.to(FastOrder());
                  },
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Wrap(
                    children: [
                      IconTitleText(
                        event: () => Get.to(FastOrder()),
                        title: "Hızlı Bir Sipariş",
                        subtitle:
                            "Müşteri Temsilcilerine bağlanmadan, hızla sipariş notunu oluştur ve ortalama bütçene göre projene değer biçelim!",
                        icon: Icons.shopping_cart,
                      ),
                      IconTitleText(
                          event: () => Get.to(const ComingSoon()),
                          title: "Müşteri Desteği",
                          subtitle:
                              "Bize sormak istediğiniz tüm sorular için Whatsapp ve Telegram hatlarımız sürekli olarak hizmetinizdedir.",
                          icon: Icons.help_center),
                      IconTitleText(
                          event: () => Get.to(const ComingSoon()),
                          title: "Tüm Hizmetlerimiz",
                          subtitle:
                              "Birçok aktif hizmetimiz var ve sizler için geliştirmeye devam ediyoruz. Hizmetlerimiz hakkında detaylı bilgi ve destek almak için buraya tıklayın.",
                          icon: Icons.account_tree_sharp),
                      IconTitleText(
                          event: () => Get.to(const ShopPage()),
                          title: "Teknoloji Marketi",
                          subtitle:
                              "Birçok yazılım ürününün bulunduğu ByBug Sanal Marketine giderek daha fazla hazır ürünü satın alabilir ve direkt kullanmaya başlayabilirsiniz.",
                          icon: Icons.shopping_basket_sharp),
                      IconTitleText(
                          event: () => Get.to(const ComingSoon()),
                          title: "Geliştirici Portalı",
                          subtitle:
                              "Geliştiriciler için ByBug Servislerine, ürün ve hizmetlerine erişim sağlayabilmelerini sağlayan dökümantasyona erişmek çok kolay!",
                          icon: Icons.code),
                      IconTitleText(
                          title: "ByBug Blog",
                          event: () => Get.to(const HomeBlog()),
                          subtitle:
                              "Blog yazarlarımız tarafından yayınlanan yazılarımıza ulaşmak, yazılar yayımlamak ve yayımlananları okumak için ByBug Blog'u ziyaret edin.",
                          icon: Icons.code),
                      IconTitleText(
                          event: () => Get.to(const ComingSoon()),
                          title: "ByBug Akademi",
                          subtitle:
                              "ByBug Projeler Grubunun sağladığı ByBug Akademi Resmi Web Uygulaması",
                          icon: Icons.web),
                      //Set Divider
                      IconTitleText(
                        event: () => Get.to(ColorConverter()),
                        title: "Renk Dönüştürme Aracı",
                        subtitle:
                            "Tasarımcılar için online renk dönüştürme aracı. Hızlı, basit, işlevsel!",
                        icon: Icons.palette,
                      ),
                      IconTitleText(
                          event: () => Get.to(const ComingSoon()),
                          title: "Doğal Afet Merkezi",
                          subtitle:
                              "Doğal Afetler hakkında bilgiler, gerekli araçlar ve hızlı iletişim bilgileri hakkında bir araç kümesi.",
                          icon: Icons.health_and_safety),
                      IconTitleText(
                          event: () => Get.to(const ComingSoon()),
                          title: "ByBug Sineması",
                          subtitle:
                              "ByBug geliştiricilerinin ve editörlerinin tavsiye ettiği filmler ve hakkında yorumlamalar. Film mi arıyorsun? O halde seni şöyle alalım!",
                          icon: Icons.movie),
                      IconTitleText(
                          event: () => Get.to(const ComingSoon()),
                          title: "Kariyer",
                          subtitle:
                              "ByBug'da çalışmak ister misin? ByBug'da Grafik Tasarım, Flutter Developer, Flutter Mentor gibi birçok alanda görev yapabilirsiniz.",
                          icon: Icons.group),
                      IconTitleText(
                          event: () => Get.to(const ComingSoon()),
                          title: "Tüm Hizmetlerimiz",
                          subtitle:
                              "ByBug size neler sunar? İşte tüm hizmetlerimizin bir listesi!",
                          icon: Icons.description),
                      IconTitleText(
                          title: "Çok Yakında!",
                          event: () => Get.to(const ComingSoon()),
                          subtitle:
                              "Buraya çok yakında yeni bir modül eklenecektir.",
                          icon: Icons.punch_clock_rounded),
                      IconTitleText(
                          event: () => Get.to(const ComingSoon()),
                          title: "Çok Yakında!",
                          subtitle:
                              "Buraya çok yakında yeni bir modül eklenecektir.",
                          icon: Icons.punch_clock_rounded),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth - 50,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "ByBug | 2023",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 30,
                                color: Colors.white60,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "E-Posta: bybugofficial@gmail.com\nByBug'ın Tüm Hakları Saklıdır.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.live_help_rounded),
      ),
    );
  }
}
