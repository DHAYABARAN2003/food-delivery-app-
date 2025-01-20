import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ui/service/database.dart';
import 'package:food_ui/widget/text_widget.dart';
import 'package:food_ui/home_page/details.dart';
import 'details.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool icream = false, vada = false, burger = false, poori = false;

  Stream? fooditeamStream;

  ontheload() async {
    fooditeamStream = await databasemethod().getfooditeam('pizza');
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allitemsverticall() {
    return StreamBuilder(
        stream: fooditeamStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, Index) {
                    DocumentSnapshot ds = snapshot.data.doc[Index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(
                              detail: ds["Details"],
                              name: ds["name"],
                              price: ds["price"],
                              image: ds['image'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0, bottom: 20.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["image"],
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        ds['name'],
                                        style: apptext.semiboldtextfeildstyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        'Honey goot cheese',
                                        style: apptext.semiboldtextfeildstyle(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        '\$' + ds['price'],
                                        style: apptext.lighttextfeildstyle(),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  Widget allitems() {
    return StreamBuilder(
        stream: fooditeamStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, Index) {
                    DocumentSnapshot ds = snapshot.data.doc[Index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(
                              detail: ds["Details"],
                              name: ds["name"],
                              price: ds["price"],
                              image: ds['image'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds['image'],
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  ds['name'],
                                  style: apptext.semiboldtextfeildstyle(),
                                ),
                                Text(
                                  'fresh and healthy',
                                  style: apptext.lighttextfeildstyle(),
                                ),
                                Text(
                                  '\$+ds[price]',
                                  style: apptext.lighttextfeildstyle(),
                                ),
                              ],
                            ),
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
        margin: EdgeInsets.only(top: 50, left: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'HELLO_SPIDER',
                  style: apptext.boldtextfeildstyle(),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(9)),
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: (Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'FOODS Delicious',
              style: apptext.headtextfeildstyle(),
            ),
            Text(
              'Discover and Get Great Food',
              style: apptext.lighttextfeildstyle(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    vada = true;
                    poori = false;
                    icream = false;
                    burger = false;
                    fooditeamStream =
                        await databasemethod().getfooditeam("vada");
                    setState(() {});
                  },
                  child: Material(
                    elevation: 9.0,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                        decoration: BoxDecoration(
                          color: vada
                              ? Color.fromARGB(255, 11, 231, 47)
                              : Color.fromARGB(255, 244, 242, 242),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          'images/vada.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    vada = false;
                    poori = true;
                    icream = false;
                    burger = false;
                    fooditeamStream =
                        await databasemethod().getfooditeam("poori");
                    setState(() {});
                  },
                  child: Material(
                    elevation: 9.0,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: poori
                            ? Color.fromARGB(255, 3, 244, 15)
                            : const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'images/poori.jpg',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    vada = false;
                    poori = false;
                    icream = true;
                    burger = false;
                    fooditeamStream =
                        await databasemethod().getfooditeam("icream");
                    setState(() {});
                  },
                  child: Material(
                    elevation: 9.0,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: icream
                              ? Color.fromARGB(255, 0, 248, 41)
                              : const Color.fromARGB(255, 255, 255, 255)),
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'images/icream.jpg',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    vada = false;
                    icream = false;
                    poori = false;
                    burger = true;
                    fooditeamStream =
                        await databasemethod().getfooditeam("burger");
                    setState(() {});
                  },
                  child: Material(
                    elevation: 9.0,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: burger
                            ? Color.fromARGB(255, 34, 255, 0)
                            : const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'images/burger.jpg',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(height: 270, child: allitems()),
            SizedBox(
              height: 20,
            ),
            allitemsverticall(),
            // Container(
            //   margin: EdgeInsets.only(right: 20.0),
            //   child: Material(
            //     elevation: 5.0,
            //     borderRadius: BorderRadius.circular(20),
            //     child: Container(
            //       padding: EdgeInsets.all(5),
            //       child: Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Image.asset(
            //             "images/burger.jpg",
            //             height: 120,
            //             width: 120,
            //             fit: BoxFit.cover,
            //           ),
            //           Column(
            //             children: [
            //               Container(
            //                 width: MediaQuery.of(context).size.width / 2,
            //                 child: Text(
            //                   'Mediterranean chickpea with Salad',
            //                   style: apptext.semiboldtextfeildstyle(),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5.0,
            //               ),
            //               Container(
            //                 width: MediaQuery.of(context).size.width / 2,
            //                 child: Text(
            //                   'Honey goot cheese',
            //                   style: apptext.semiboldtextfeildstyle(),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5.0,
            //               ),
            //               Container(
            //                 width: MediaQuery.of(context).size.width / 2,
            //                 child: Text(
            //                   '\$25',
            //                   style: apptext.lighttextfeildstyle(),
            //                 ),
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
