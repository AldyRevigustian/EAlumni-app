import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:instagram_redesign_ui/constant.dart';
import 'package:instagram_redesign_ui/helper/get_helper.dart';
import 'package:instagram_redesign_ui/models/api_response.dart';
import 'package:instagram_redesign_ui/screens/login_screen.dart';
import 'package:instagram_redesign_ui/screens/main/navbar.dart';
import 'package:instagram_redesign_ui/services/post_service.dart';
import 'package:instagram_redesign_ui/services/user_service.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../const.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key key, this.image}) : super(key: key);

  final Uint8List image;

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController caption = new TextEditingController(); // th
  final _formKey = GlobalKey<FormState>();

  void _createPost() async {
    String image =
        widget.image == null ? null : getStringImageByte(widget.image);
    ApiResponse response = await createPost(caption.text, image);
    if (response.error == null) {
      Navigator.of(context).pop();
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
      // setState(() {
      //   _loading = !_loading;
      // });
    }
  }

  @override
  void initState() {
    log(widget.image.toString());
    super.initState();
  }

  String _value;
  String errorText;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.white,
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
            style: TextStyle(color: Colors.black, fontSize: 25),
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
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the caption.';
                  }
                  return null;
                },
                controller: caption,
                decoration: InputDecoration(hintText: "Caption"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            MaterialButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _createPost();
                }
              },
              minWidth: width / 1.15,
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
