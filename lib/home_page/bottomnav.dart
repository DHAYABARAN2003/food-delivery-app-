import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:food_ui/home_page/order.dart';
import 'package:food_ui/home_page/profile.dart';
import 'package:food_ui/home_page/ui_1.dart';
import 'wallet.dart';

class bottomnav extends StatefulWidget {
  const bottomnav({super.key});

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  int currenttabindex = 0;
  late List<Widget> page;
  late Widget currentpage;
  late home homepage;
  late Order order;
  late Wallet wallet;
  late Profile profile;
  @override
  void initState() {
    // TODO: implement initState
    homepage = home();
    order = Order();
    wallet = Wallet();
    profile = Profile();
    page = [homepage, order, wallet, profile];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Color.fromARGB(255, 91, 3, 255),
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currenttabindex = index;
          });
        },
        items: const [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.wallet_outlined,
              color: Colors.white,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: page[currenttabindex],
    );
  }
}
