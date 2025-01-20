import 'package:flutter/material.dart';
import 'package:food_ui/widget/text_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Wallet',
                style: apptext.headtextfeildstyle(),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 215, 211, 211)),
              child: Row(
                children: [
                  Image.asset(
                    'images/wallet.jpg',
                    height: 60.0,
                    width: 60.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "you wallet",
                        style: apptext.lighttextfeildstyle(),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "\$" + '100',
                        style: apptext.boldtextfeildstyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Add money",
                style: apptext.semiboldtextfeildstyle(),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 206, 199, 199),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "\$" + '100',
                    style: apptext.semiboldtextfeildstyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 206, 199, 199),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "\$" + '200',
                    style: apptext.semiboldtextfeildstyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 206, 199, 199),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "\$" + '300',
                    style: apptext.semiboldtextfeildstyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 206, 199, 199),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "\$" + '400',
                    style: apptext.semiboldtextfeildstyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 206, 199, 199),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "\$" + '500',
                    style: apptext.semiboldtextfeildstyle(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(vertical: 12.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 11, 60, 13),
                  borderRadius: BorderRadius.circular(9.5)),
              child: Center(
                child: Text(
                  'Add Money',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
