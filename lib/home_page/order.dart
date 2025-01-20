import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ui/home_page/details.dart';
import 'package:food_ui/service/database.dart';
import 'package:food_ui/service/shared_preff.dart';
import 'package:food_ui/widget/text_widget.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? id, wallet;

  int total = 0;

  void starttime() {
    Timer(Duration(seconds: 5), () {
      setState(() {});
    });
  }

  getthesharedpref() async {
    id = await sharedpreferencehelper().getuserid();
    // wallet=await sharedpreferencehelper().getuserewallet;{};
    setState(() {});
  }

  ontheload() async {
    foodstream = null;
    await getthesharedpref();
    foodstream = await databasemethod().getfoodcard(id!);
    setState(() {});
  }

  @override
  void setState(VoidCallback fn) {
    ontheload();
    starttime();
    super.setState(fn);
  }

  Stream? foodstream;
  Widget foodcard() {
    return StreamBuilder(
        stream: foodstream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, Index) {
                    DocumentSnapshot ds = snapshot.data.doc[Index];

                    total = total + int.parse(ds['total']);

                    return Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0)),
                          margin: EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20.0),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 70.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Center(child: Text('Quantity')),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(60.0),
                                  child: Image.network(
                                    ds['image'],
                                    height: 90,
                                    width: 90,
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                children: [
                                  Text(
                                    ds['name'],
                                    style: apptext.semiboldtextfeildstyle(),
                                  ),
                                  Text(
                                    '\$' + ds["total"],
                                    style: apptext.semiboldtextfeildstyle(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "Food cart",
                    style: apptext.headtextfeildstyle(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Container(
            //   margin: EdgeInsets.only(left: 20.0, right: 20.0),
            //   child: Material(
            //     elevation: 5.0,
            //     borderRadius: BorderRadius.circular(10.0),
            //     child: Container(
            //       decoration:
            //           BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            //       margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            //       child: Row(
            //         // crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Container(
            //             height: 70.0,
            //             width: 30.0,
            //             decoration: BoxDecoration(
            //                 border: Border.all(),
            //                 borderRadius: BorderRadius.circular(10.0)),
            //             child: Center(child: Text('2')),
            //           ),
            //           SizedBox(
            //             width: 20.0,
            //           ),
            //           ClipRRect(
            //               borderRadius: BorderRadius.circular(60.0),
            //               child: Image.asset(
            //                 'images/boy.jpg',
            //                 height: 90,
            //                 width: 90,
            //                 fit: BoxFit.cover,
            //               )),
            //           SizedBox(
            //             width: 20.0,
            //           ),
            //           Column(
            //             children: [
            //               Text(
            //                 "pizza",
            //                 style: apptext.semiboldtextfeildstyle(),
            //               ),
            //               Text(
            //                 "\$40",
            //                 style: apptext.semiboldtextfeildstyle(),
            //               )
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 20.0,
            ),
            Container(
                height: MediaQuery.of(context).size.height / 2,
                child: foodcard()),
            Spacer(),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'total price',
                    style: apptext.boldtextfeildstyle(),
                  ),
                  Text(
                    "\$" + total.toString(),
                    style: apptext.semiboldtextfeildstyle(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                  children: [
                    Text("We are working on it"),
                    Icon(Icons.add_alert),
                  ],
                )));
                // Text("Working on it!");
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
                child: Center(
                  child: Text(
                    'Check out',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
