import 'dart:html';
import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_ui/home_page/bottomnav.dart';

class authmethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getcurrentuser() async {
    return await auth.currentUser;
  }

  Future signout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future deleteuser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    user?.delete();
  }

}
