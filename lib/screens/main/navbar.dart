import 'package:flutter/material.dart';
import 'package:instagram_redesign_ui/const.dart';
import 'package:instagram_redesign_ui/screens/main/home_screen.dart';
import 'package:instagram_redesign_ui/screens/main/post/post_screen.dart';
import 'package:instagram_redesign_ui/screens/main/profile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int curent = 0;

  final List screen = [
    HomeScreen(),
    // KenanganScreen(),
    ProfileScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget curentScreen = HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:
      //     curent == 2 || curent == 3 ? Colors.white : CustColors.primaryWhite,
      body: PageStorage(
        bucket: bucket,
        child: curentScreen,
      ),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomAppBar(
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          curentScreen = HomeScreen();
                          curent = 0;
                        });
                      },
                      minWidth: 40,
                      child: curent == 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MdiIcons.home),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  MdiIcons.home,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )),
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      // color: Color(0xFF23B66F),
                      color: CustColors.primaryBlue.withOpacity(0.9),
                      onPressed: () {
                        setState(() {
                          curentScreen = PostScreen();
                          curent = 1;
                        });
                      },
                      // onPressed: () => print('Upload Photo'),
                      child: Icon(
                        Icons.add_box_rounded,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          curentScreen = ProfileScreen();
                          curent = 2;
                        });
                      },
                      minWidth: 40,
                      child: curent == 2
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )),
                ],
              ),
            ),
          )),
    );
  }
}
