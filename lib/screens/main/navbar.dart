import 'package:flutter/material.dart';
import 'package:instagram_redesign_ui/const.dart';
import 'package:instagram_redesign_ui/screens/main/akreditasi_screen.dart';
import 'package:instagram_redesign_ui/screens/main/feed_screen.dart';
import 'package:instagram_redesign_ui/screens/main/kenangan_screen.dart';
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
    FeedScreen(),
    KenanganScreen(),
    ProfileScreen(),
    AkreditasiScreen()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget curentScreen = FeedScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          curentScreen = FeedScreen();
                          curent = 0;
                        });
                      },
                      minWidth: 40,
                      child: curent == 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MdiIcons.newspaperVariantMultipleOutline),
                                Text(
                                  "Berita",
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
                                  MdiIcons.newspaperVariantMultiple,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "Berita",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )),
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          curentScreen = KenanganScreen();
                          curent = 1;
                        });
                      },
                      minWidth: 40,
                      child: curent == 1
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MdiIcons.history),
                                Text(
                                  "Kenangan",
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
                                  MdiIcons.history,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "Kenangan",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            )),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      // color: Color(0xFF23B66F),
                      color: CustColors.primaryBlue,
                      onPressed: () {
                        setState(() {
                          curentScreen = PostScreen();
                          curent = 2;
                        });
                      },
                      // onPressed: () => print('Upload Photo'),
                      child: Icon(
                        Icons.add,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          curentScreen = ProfileScreen();
                          curent = 3;
                        });
                      },
                      minWidth: 40,
                      child: curent == 3
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
                  MaterialButton(
                      onPressed: () {
                        setState(() {
                          curentScreen = AkreditasiScreen();
                          curent = 4;
                        });
                      },
                      minWidth: 40,
                      child: curent == 4
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.feed),
                                Text(
                                  "Akreditasi",
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
                                  Icons.feed_outlined,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "Akreditasi",
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
