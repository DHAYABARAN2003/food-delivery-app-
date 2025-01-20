import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class databasemethod {
  Future adduserdetails(Map<String, dynamic> userinfomap, String id) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .set(userinfomap);
  }

  updateuserwallet(String id, String amount) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .update({'wallet': amount});
  }

  Future addfooditeam(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getfooditeam(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addfoodcard(Map<String, dynamic> userinfomap, String id) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection('cart')
        .add(userinfomap);
  }

  Future<Stream<QuerySnapshot>> getfoodcard(String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('card')
        .snapshots();
  }

  // updateuserwallet(String id, String amount) async {
  //   return await FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(id)
  //       .update({'wallet': amount});
  // }
}
