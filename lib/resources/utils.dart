import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static const String _loginIdKey = 'loginId';
  static String loginId = "";

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.bounceIn,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
          padding: EdgeInsets.all(15),
          icon: Icon(Icons.error),
          // title: "Flush Bar",
          message: message,
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static dateFormat1(value) {
    //Output: 01/Jan/23
    return DateFormat('dd/MMM/yy').format(DateTime.parse(value.toString()));
  }

  static dateFormat2(value) {
    // Output: Sun, 01 Jan 23
    return DateFormat('E, dd MMM yy').format(DateTime.parse(value.toString()));
  }

  static dateTimeFormat(value) {
    // Output: Sun, 01 Jan 23
    return DateFormat(' HH:mm, E, dd MMM yy')
        .format(DateTime.parse(value.toString()));
  }

  static getMonth(value) {
    // Output: Sun, 01 Jan 23
    return DateFormat('MMM').format(DateTime.parse(value.toString()));
  }
  // static String dateFormat2(DateTime dt) {
  //   return DateFormat('yyyy-MM-dd').format(dt);
  // }

  static int intFormat(value) {
    return int.parse(value.toString());
  }

  static DateTime dateFormatter(value) {
    final date = DateTime.parse(value.toString());
    return DateTime.parse("${date}Z");
  }

  static Future<void> storeLoginId(String loginId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_loginIdKey, loginId);
    getId();
  }

  static String getInitial(String phrase) {
    List<String> words = phrase.split(' ');

    if (words.isNotEmpty) {
      String initials = '';
      for (String word in words) {
        if (word.isNotEmpty) {
          initials += word[0].toUpperCase();
        }
      }
      return initials;
    } else {
      return "Unknown";
    }
  }

  static String getInitialWord(String phrase) {
    List<String> words = phrase.split(' ');

    if (words.isNotEmpty) {
      return words[0];
    } else {
      return "Unknown";
    }
  }

  static String getOrderStatus(String complete, String cancel, String failed) {
    if (complete == "1") {
      return "Delivered";
    } else if (cancel == "1") {
      return "Canceled";
    } else if (failed == "1") {
      return "Failed";
    } else {
      return "Unknown";
    }
  }

  static Future<String> getLoginId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_loginIdKey) ?? '';
  }

  static String getId() {
    var id = getLoginId();
    loginId = id.toString();
    print("<<<<<<<<<<<<<<<<<<LoginId $loginId>>>>>>>>>>>>>>>>>>");
    return loginId;
  }

  // void shareText(String text) {
  //   Share.share(text);
  // }
  // void storeLoginId(String loginId) async {
  //   debugPrint("store login id");
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString("loginId", loginId);
  // }

  // Future<String> getLoginId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String id = prefs.getString("loginId")?.toString() ?? "";
  //   return id;
  // }
}
