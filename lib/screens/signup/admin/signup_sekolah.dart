import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_redesign_ui/const.dart';
import 'package:instagram_redesign_ui/screens/feed_screen.dart';
import 'package:instagram_redesign_ui/screens/signup/admin/signup_admin.dart';
import 'package:instagram_redesign_ui/screens/signup/alumni/signup_alumni_next.dart';

class SignupSekolah extends StatefulWidget {
  const SignupSekolah({Key key}) : super(key: key);

  @override
  State<SignupSekolah> createState() => _SignupSekolahState();
}

class _SignupSekolahState extends State<SignupSekolah> {
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  String dropdownValue;
  String _value;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 40,
                  // ),
                  Text(
                    "DAFTAR SEKOLAH",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/user0.png"),
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.camera),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Nama Sekolah",
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.business)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Alamat Sekolah",
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.location_pin)),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Kota Asal Sekolah",
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.map)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Deskripsi Sekolah",
                      prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.school)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignupAdmin(),
                        ));
                      }
                    },
                    // onTap: () =>

                    child: Container(
                      child: Text(
                        'Simpan',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lato",
                        ),
                      ),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        color: CustColors.primaryBlue,
                      ),
                    ),
                    // onTap: loginUser,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
