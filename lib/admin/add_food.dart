import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_ui/service/database.dart';
import 'package:food_ui/widget/text_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class addfood extends StatefulWidget {
  const addfood({super.key});

  @override
  State<addfood> createState() => _addfoodState();
}

class _addfoodState extends State<addfood> {
  final List<String> iteams = ['icream', 'burger', 'poori', 'vada'];
  String? value;
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController pricecontroller = new TextEditingController();
  TextEditingController detailcontroller = new TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedimage;

  Future getimage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectedimage = File(image!.path);
    setState(() {});
  }

  uploadimage() async {
    if (selectedimage != null &&
        namecontroller.text != "" &&
        pricecontroller.text != "" &&
        detailcontroller.text != "") {
      String addid = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('blogimage').child(addid);
      final UploadTask task = firebaseStorageRef.putFile(selectedimage!);

      var downloadurl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> additeam = {
        "image": downloadurl,
        "name": namecontroller.text,
        "price": pricecontroller.text,
        "detail": detailcontroller.text,
      };
      await databasemethod().addfooditeam(additeam, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Food item has been added successfully',
            style: TextStyle(fontSize: 18.0),
          ),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            )),
        centerTitle: true,
        title: Text(
          'Add Iteam',
          style: apptext.headtextfeildstyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'uplpde the iteam pick',
                style: apptext.semiboldtextfeildstyle(),
              ),
              SizedBox(height: 20.0),
              selectedimage == null
                  ? GestureDetector(
                      onTap: () {
                        getimage();
                      },
                      child: Center(
                        child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Icon(Icons.camera_enhance),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.file(
                              selectedimage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'iteam Name',
                style: apptext.semiboldtextfeildstyle(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter iteam name',
                    hintStyle: apptext.lighttextfeildstyle(),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'iteam Price',
                style: apptext.semiboldtextfeildstyle(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: pricecontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter iteam Price',
                    hintStyle: apptext.lighttextfeildstyle(),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Iteam Detail',
                style: apptext.semiboldtextfeildstyle(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  maxLines: 6,
                  controller: detailcontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter iteam Detail',
                    hintStyle: apptext.lighttextfeildstyle(),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Select category',
                style: apptext.semiboldtextfeildstyle(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: iteams
                        .map((iteam) => DropdownMenuItem<String>(
                            value: iteam,
                            child: Text(
                              iteam,
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            )))
                        .toList(),
                    onChanged: ((value) => setState(
                          () {
                            this.value = value;
                          },
                        )),
                    dropdownColor: Colors.white,
                    hint: Text('Select categor'),
                    iconSize: 36,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: value,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  uploadimage();
                },
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'ADD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
