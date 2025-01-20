import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ui/admin/add_food.dart';
import 'package:food_ui/widget/text_widget.dart';

class homeadmin extends StatefulWidget {
  const homeadmin({super.key});

  @override
  State<homeadmin> createState() => _homeadminState();
}

class _homeadminState extends State<homeadmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 50.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                'HOME ADMIN',
                style: apptext.headtextfeildstyle(),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => addfood()),
                );
              },
              child: Container(
                child: Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Image.asset(
                              'images/admin_img.jpg',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            'Add Food iteams',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
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
