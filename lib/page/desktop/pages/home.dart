import 'package:bybug/page/desktop/page_blog/home.dart';
import 'package:bybug/page/desktop/pages/comingsoon.dart';
import 'package:bybug/page/desktop/shop/shop.dart';
import 'package:bybug/widget/button.dart';
import 'package:bybug/widget/icon_title_text.dart';
import 'package:bybug/widget/score.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../skeleton.dart';
import '../../../theme/color.dart';
import '../../../widget/banner.dart';
import 'fast_order.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

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
                          event: () => Get.to(ShopPage()),
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
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  children: const [
                    ScoreWidget(
                      scoreText: "Toplam Sipariş Sayısı",
                      score: "24",
                      color: Color.fromARGB(255, 13, 18, 31),
                    ),
                    ScoreWidget(
                      scoreText: "Toplam Bağımsız Proje Sayısı",
                      score: "3",
                      color: Color.fromARGB(255, 13, 18, 31),
                    ),
                    ScoreWidget(
                      scoreText: "Destek Olduğumuz Proje Sayısı",
                      score: "52",
                      color: Color.fromARGB(255, 13, 18, 31),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    BannerWidget(
                      constraints: constraints,
                      image: "assets/images/A3.jpg",
                      left: true,
                      miniTitle: "ByBug, her zaman kolay araçlara yönelir.",
                      title: "Kolay, erişilebilir ve sade!",
                      subtitle:
                          "ByBug, projeler geliştirirken her zaman en erişilebilir ve basit araçları kullanır. Mobil uygulama geliştirirken projeyi müşteriye teslim ettiğimizde, müşterimizin projeyi düzenleyebilmesi için sürükle-bırak mantığına sahip Kodular isimli aracı kullanırız. Web site geliştirirken projeyi müşteriye teslim ettiğimizde, müşterimizin projeyi düzenleyebilmesi için sürükle-bırak mantığına sahip WordPress isimli aracı kullanırız.",
                    ),
                    BannerWidget(
                      constraints: constraints,
                      image: "assets/images/A1.jpg",
                      left: false,
                      miniTitle: "ByBug, müşterilerinin fikirlerini önemser.",
                      title: "Müşteri ne derse, o olur!",
                      subtitle:
                          "ByBug içerisinde projesi olan müşterimiz, projenin tüm detaylarına aktif olarak müdahalede bulunabilir ve eğer isterse projenin ortasında, projede kendi eliyle değişiklik yapabilir. ByBug ekibi esnek çalışır ve tüm durumlara karşı hazırlıklıdır.",
                    ),
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
