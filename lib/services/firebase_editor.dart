import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseEditor {
  ///It stores data to <b>Firebase Realtime Database.</b>
  ///<br>It leverages FirebaseEditor's [encode] feature to do this.
  ///<br>Data is sent with a special encryption.
  static Future<String> storeValue(
      String reference, String tag, List valueList) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref(reference);
      String val = FirebaseEditor.encode(valueList);
      await ref.child('"$tag"').set(val);
      return "successful";
    } catch (e) {
      return "error: ${e.toString()}";
    }
  }

  static Future<List> getOnce(String reference) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(reference);
    DataSnapshot snapshot = await ref.get();

    Map mapX = snapshot.value as Map;
    List retVal = [];
    for (var i = 0; i < mapX.keys.length; i++) {
      retVal.add(FirebaseEditor.decodeAndTagAddEndElement(
          mapX.keys.elementAt(i), mapX.values.elementAt(i)));
    }
    return retVal;
  }

  ///It pulls data from Firebase Realtime Database.
  ///<br>Data must be pulled with a password provided by FirebaseEditor.
  ///<br>If you try to pull a different data, an error may occur.

  ///Encrypts the list with a key and converts it to String format.<br>You can store it as a String.
  ///!feValueIndex!
  ///The list has been converted to a String format. Use this to decode: [decode].
  static String encode(List value) {
    String feValue = "";
    for (var count = 0; count < value.length; count++) {
      feValue = "$feValue~~!feValueIndex!~~${value[count]}";
    }
    return feValue;
  }

  ///Decode an encrypted String type data with [encode].
  static List decode(String value) {
    return value.split("~~!feValueIndex!~~");
  }

  static List decodeAndTagAddEndElement(String key, String value) {
    List sendValue = value.split("~~!feValueIndex!~~");
    sendValue.add(key);
    return sendValue;
  }

  static Future<List> register(
      String email, String password, List userDatas) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await FirebaseEditor.storeValue("users", user.user!.uid, userDatas);
      return [1.toString(), user.user.toString()];
    } catch (e) {
      return [0.toString(), e.toString()];
    }
  }

  static Future<List> login(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      var user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return [1, user.user];
    } catch (e) {
      return [0, e.toString()];
    }
  }

  static logout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
  }

  static Future<String> getUID() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    return uid;
  }

  static bool isSignedIn() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List> getProfile() async {
    if (FirebaseEditor.isSignedIn()) {
      FirebaseAuth auth = FirebaseAuth.instance;
      String getUid = auth.currentUser!.uid;
      DatabaseReference ref = FirebaseDatabase.instance.ref("users");
      DataSnapshot snapshot = await ref.get();
      Map mapX = snapshot.value as Map;
      String user = "";
      List mapList = mapX.keys.toList();

      for (var i = 0; i < mapList.length; i++) {
        if (mapList[i].toString().contains(getUid)) {
          user = mapList[i];
        }
      }
      DatabaseReference refer = FirebaseDatabase.instance.ref("users/$user");
      DataSnapshot snapval = await refer.get();

      return FirebaseEditor.decode(snapval.value.toString());
    } else {
      return [];
    }
  }
}
