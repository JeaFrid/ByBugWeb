class ColorUtils {
  static String hextoRgb(String input) {
    String hexColor = input;
    int red = int.parse(hexColor.substring(1, 3), radix: 16);
    int green = int.parse(hexColor.substring(3, 5), radix: 16);
    int blue = int.parse(hexColor.substring(5, 7), radix: 16);

    return "$red,$green,$blue";
  }

  static String hextoNum(String input) {
    var hexCode = input;
    final buffer = StringBuffer();
    buffer.write(hexCode);
    return ((int.parse(buffer.toString(), radix: 16) * -1 + 16777216) * -1)
        .toString();
  }
}
