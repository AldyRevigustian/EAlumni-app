import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_redesign_ui/const.dart';
import 'package:instagram_redesign_ui/screens/main/feed_screen.dart';

class SignupAlumniNext extends StatefulWidget {
  const SignupAlumniNext({Key key}) : super(key: key);

  @override
  State<SignupAlumniNext> createState() => _SignupAlumniNextState();
}

class _SignupAlumniNextState extends State<SignupAlumniNext> {
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
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "PROFIL ALUMNI",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    DropdownButtonFormField(
                      validator: (value) =>
                          value == null ? 'Please fill this field' : null,
                      isExpanded: true,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      decoration: InputDecoration(
                        hintText: "Status",
                        prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.business_center)),
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                        log(newValue);
                      },
                      items: <String>[
                        'Kuliah',
                        'Kerja',
                        'Lainya',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Tambahkan Perguruan Tinggi",
                        prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.location_on)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Jurusan",
                        prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.phone)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Tahun Masuk",
                        prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.person)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Tahun Lulus (jika sudah lulus)",
                        prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.school)),
                      ),
                    ),
                    dropdownValue == "Kerja"
                        ? Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Tempat Kerja",
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
                                  hintText: "Jabatan",
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
                                  hintText: "Alamat",
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
                                  hintText: "Tahun Masuk",
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(Icons.business)),
                                ),
                              ),
                            ],
                          )
                        : Center(),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FeedScreen(),
                          ));
                        }
                      },

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
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
