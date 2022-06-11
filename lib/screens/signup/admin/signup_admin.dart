import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_redesign_ui/const.dart';
import 'package:instagram_redesign_ui/screens/feed_screen.dart';
import 'package:instagram_redesign_ui/screens/signup/alumni/signup_alumni_next.dart';

class SignupAdmin extends StatefulWidget {
  const SignupAdmin({Key key}) : super(key: key);

  @override
  State<SignupAdmin> createState() => _SignupAdminState();
}

class _SignupAdminState extends State<SignupAdmin> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustColors.primaryWhite,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "PROFIL ADMIN SEKOLAH",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  radius: 58,
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
                    hintText: "Alamat",
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.location_on)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  decoration: InputDecoration(
                    hintText: "Nama Sekolah",
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.business)),
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                    log(newValue);
                  },
                  items: <String>[
                    'SMK Negeri 10 Surabaya',
                    'SMA Negeri 15 Surabaya',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignupAlumniNext(),
                        )),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Selanjutnya"),
                        Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    )
                    // onTap: loginUser,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
