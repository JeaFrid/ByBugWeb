import 'dart:math';

class JeaRandom {
  static String string(int length) {
    final List abc = [
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "i",
      "j",
      "k",
      "l",
      "m",
      "n",
      "o",
      "p",
      "r",
      "s",
      "t",
      "u",
      "v",
      "y",
      "x",
      "w",
      "z",
    ];
    String result = "";
    for (var i = 0; i < length; i++) {
      result = result + abc[Random().nextInt(abc.length)];
    }
    return result;
  }

  static int integer(int length) {
    return Random().nextInt(length);
  }
}
