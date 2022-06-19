import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:instagram_redesign_ui/helper/get_helper.dart';
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
  TextEditingController caption = new TextEditingController(); // th
  final _formKey = GlobalKey<FormState>();
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
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 35,
                    child: Row(
                      children: [
                        Radio(
                            value: "berita",
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
                  ),
                  Container(
                    height: 35,
                    child: Row(
                      children: [
                        Radio(
                            value: "kenangan",
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
                  ),
                  // Text(errorText)
                  errorText != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            errorText,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        )
                      : Center()
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            MaterialButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  if (_value != null) {
                    bool masuk = await GetHelper().postFeed("Aldy",
                        "authorImageUrl", " imageUrl", _value, caption.text);

                    masuk == true
                        ? Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Navbar(),
                            ),
                          )
                        : AlertDialog(
                            title: Text("Error"),
                          );
                  } else {
                    setState(() {
                      errorText = "Please Chose Type";
                    });
                    log(errorText);
                  }
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
