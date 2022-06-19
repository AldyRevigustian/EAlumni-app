import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_redesign_ui/const.dart';
import 'package:instagram_redesign_ui/screens/main/berita_screen.dart';
import 'package:instagram_redesign_ui/screens/login_screen.dart';
import 'package:instagram_redesign_ui/screens/signup/admin/signup_admin.dart';
import 'package:instagram_redesign_ui/screens/signup/alumni/signup_alumni.dart';
import 'package:instagram_redesign_ui/screens/signup/karyawan/signup_karyawan.dart';

class AkreditasiNext extends StatefulWidget {
  const AkreditasiNext({Key key}) : super(key: key);

  @override
  State<AkreditasiNext> createState() => _AkreditasiNextState();
}

class _AkreditasiNextState extends State<AkreditasiNext> {
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "AKREDITASI",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Pertanyaan",
                      // prefixIcon: Padding(
                      //     padding: EdgeInsets.only(right: 10),
                      //     child: Icon(Icons.person)
                      //     ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Pertanyaan",
                      // prefixIcon: Padding(
                      //     padding: EdgeInsets.only(right: 10),
                      //     child: Icon(Icons.person)
                      //     ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Pertanyaan",
                      // prefixIcon: Padding(
                      //     padding: EdgeInsets.only(right: 10),
                      //     child: Icon(Icons.person)
                      //     ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Pertanyaan",
                      // prefixIcon: Padding(
                      //     padding: EdgeInsets.only(right: 10),
                      //     child: Icon(Icons.person)
                      //     ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Pertanyaan",
                      // prefixIcon: Padding(
                      //     padding: EdgeInsets.only(right: 10),
                      //     child: Icon(Icons.person)
                      //     ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Pertanyaan",
                      // prefixIcon: Padding(
                      //     padding: EdgeInsets.only(right: 10),
                      //     child: Icon(Icons.person)
                      //     ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if (dropdownValue == "Alumni") {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupAlumni(),
                          ));
                        }
                        if (dropdownValue == "Guru / Karyawan") {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupKaryawan(),
                          ));
                        }
                        if (dropdownValue == "Admin Sekolah") {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupAdmin(),
                          ));
                        }
                      }
                    },
                    minWidth: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        'Upload Jawaban',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lato",
                        ),
                      ),
                    ),
                    color: CustColors.primaryBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
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
