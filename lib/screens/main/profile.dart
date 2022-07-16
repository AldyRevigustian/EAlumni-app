import 'dart:io';
import 'package:flutter/material.dart';
import 'package:instagram_redesign_ui/loading.dart';
import 'package:instagram_redesign_ui/screens/login_screen.dart';
import 'package:instagram_redesign_ui/services/user_service.dart';

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
        // backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "Profile",
              style: TextStyle(color: Colors.black, fontSize: 25),
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
              onTap: () {
                logout().then((value) => {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) => false)
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.logout,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
