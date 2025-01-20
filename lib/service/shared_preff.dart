import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharedpreferencehelper {
  static String useridkey = 'userkey';
  static String username = 'username';
  static String useremailkey = 'useremailkey';
  static String userwalletkey = 'userwalletkey';
  static String userprofilekey = 'userprofilekey';

  Future<bool> saveuserid(String getuserid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(useridkey, getuserid);
  }

  Future<bool> saveusername(String getusername) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(username, getusername);
  }

  Future<bool> saveuseremail(String getuseremail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(useremailkey, getuseremail);
  }

  Future<bool> saveusereprofile(String getuserprofile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userprofilekey, getuserprofile);
  }

  Future<bool> saveuserwallet(String getuserwallet) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userwalletkey, getuserwallet);
  }

  Future<String?> getuserid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(useridkey);
  }

  Future<String?> getusername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(username);
  }

  Future<String?> getuseremail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(useremailkey);
  }

  Future<String?> getuserewallet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userwalletkey);
  }

  Future<String?> getuserprofile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userprofilekey);
  }
}
