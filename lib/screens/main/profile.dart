import 'dart:io';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "Profile",
              style: TextStyle(
                  color: Colors.black, fontFamily: "Billabong", fontSize: 30),
            ),
          ),
          centerTitle: true,
          actions: [
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            //     child: Text(
            //       "Next",
            //       style: TextStyle(color: Colors.blue, fontFamily: "Proxima"),
            //     ),
            //   ),
            // )
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height / 30,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/user1.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: width / 1,
                      child: Text(
                        "Aldy Revigustian",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        child: Center(
                          child: Icon(
                            Icons.school,
                            size: 23,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )),
                        width: 20,
                      ),
                      Container(
                        width: width / 1.4,
                        child: Text(
                          "Pengajar Di SMK 10 Surabaya",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        child: Icon(
                          Icons.location_on,
                          size: 23,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )),
                        width: 20,
                      ),
                      Container(
                        width: width / 1.4,
                        child: Text(
                          "Surabaya",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 50,
                          child: Center(
                            child: Text(
                              "Masuk",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          )),
                      Container(
                        child: Center(
                            child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )),
                        width: 20,
                      ),
                      Container(
                        width: width / 1.4,
                        child: Text(
                          "2014",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 50,
                          child: Center(
                            child: Text(
                              "Lulus",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          )),
                      Container(
                        child: Center(
                            child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )),
                        width: 20,
                      ),
                      Container(
                        width: width / 1.4,
                        child: Text(
                          "2016",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        child: Icon(
                          Icons.home,
                          size: 23,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )),
                        width: 20,
                      ),
                      Container(
                        width: width / 1.4,
                        child: Text(
                          "Jl. Bukit Duri Tanjakan 1 No.11 Rt.11 Rw.12 Bukit Duri, Tebet, Jakarta Selatan, DKI Jakarta",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        child: Icon(
                          Icons.phone,
                          size: 23,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )),
                        width: 20,
                      ),
                      Container(
                        width: width / 1.4,
                        child: Text(
                          "081218019667",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        child: Center(
                          child: Icon(
                            Icons.school,
                            size: 23,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )),
                        width: 20,
                      ),
                      Container(
                        width: width / 1.4,
                        child: Text(
                          "Berkuliah di universitas Surabaya",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 50,
                          child: Center(
                            child: Text(
                              "Masuk",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          )),
                      Container(
                        child: Center(
                            child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                          ),
                        )),
                        width: 20,
                      ),
                      Container(
                        width: width / 1.4,
                        child: Text(
                          "2016",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 30,
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
