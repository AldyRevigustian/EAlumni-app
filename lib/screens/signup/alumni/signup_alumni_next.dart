import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_redesign_ui/const.dart';
import 'package:instagram_redesign_ui/screens/main/berita_screen.dart';
import 'package:instagram_redesign_ui/screens/main/navbar.dart';

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
                            child: Icon(Icons.school)),
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
                    MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Navbar(),
                          ));
                        }
                      },
                      minWidth: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          'Simpan',
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
