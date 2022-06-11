import 'package:flutter/material.dart';
import 'package:instagram_redesign_ui/const.dart';
import 'package:instagram_redesign_ui/screens/main/feed_screen.dart';
import 'package:instagram_redesign_ui/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Redesign UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: CustColors.primaryWhite,
        fontFamily: 'Proxima',
      ),
      home: LoginScreen(),
    );
  }
}
