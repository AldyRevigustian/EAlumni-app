import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:instagram_redesign_ui/screens/main/navbar.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../const.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key key, this.image}) : super(key: key);

  final Uint8List image;

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  void initState() {
    log(widget.image.toString());
    super.initState();
  }

  String _value;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: InkWell(
          // borderRadius: BorderRadius.circular(100),
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            "Post",
            style: TextStyle(
                color: Colors.black, fontFamily: "Billabong", fontSize: 30),
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            (widget.image != null)
                ? Container(
                    child: Center(child: Image.memory(widget.image)),
                    height: height / 2.5,
                  )
                : Container(
                    // child: Center(child: Image.memory(widget.image)),
                    height: height / 2.5,
                  ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: TextField(
                decoration: InputDecoration(hintText: "Caption"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                          value: "Berita",
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                              log(_value);
                            });
                          }),
                      Text("Berita")
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "Kenangan Sekolah",
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                              log(_value);
                            });
                          }),
                      Text("Kenangan Sekolah")
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // InkWell(
            //   onTap: () => Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) => Navbar(),
            //     ),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 30, right: 30),
            //     child: Container(
            //       child: Text(
            //         'Post',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontFamily: "Lato",
            //         ),
            //       ),
            //       width: double.infinity,
            //       alignment: Alignment.center,
            //       padding: const EdgeInsets.symmetric(vertical: 12),
            //       decoration: const ShapeDecoration(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(100)),
            //         ),
            //         color: CustColors.primaryBlue,
            //       ),
            //     ),
            //   ),
            //   // onTap: loginUser,
            // ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Navbar(),
                  ),
                );
              },
              minWidth: width / 1.2,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  'Post',
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
    );
  }
}
