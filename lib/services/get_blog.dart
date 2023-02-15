import 'dart:convert';

import 'package:bybug/services/firebase_editor.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class Blog {
  static Future<List> getOnce() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("blog");
    DataSnapshot snapshot = await ref.get();

    Map mapX = snapshot.value as Map;
    List retVal = [];
    for (var i = 0; i < mapX.keys.length; i++) {
      retVal.add(FirebaseEditor.decodeAndTagAddEndElement(
          mapX.keys.elementAt(i), mapX.values.elementAt(i)));
      //retVal.add(FirebaseEditor.decode(mapX.values.elementAt(i)));
    }
    return retVal;
  }

  static Future<List> getBlogContent(String tag) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("blog/$tag");
    DataSnapshot snapshot = await ref.get();

    return FirebaseEditor.decode(snapshot.value.toString());
  }
}
