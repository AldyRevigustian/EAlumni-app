import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram_redesign_ui/const.dart';
import 'package:instagram_redesign_ui/models/kenangan_model.dart';
import 'package:instagram_redesign_ui/models/post_model.dart';
import 'package:instagram_redesign_ui/screens/main/view_post_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class KenanganScreen extends StatefulWidget {
  @override
  _KenanganScreenState createState() => _KenanganScreenState();
}

class _KenanganScreenState extends State<KenanganScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  List<Widget> _buildPosts() {
    List<Widget> postWidgets = List<Widget>();
    for (int i = 0; i < kenangans.length; i++) {
      postWidgets.add(_BuildPost(
        index: i,
      ));
    }
    return postWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      'Kenangan',
                      style: TextStyle(
                        fontFamily: 'Billabong',
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Column(
                      children: _buildPosts(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildPost extends StatefulWidget {
  const _BuildPost({Key key, this.index}) : super(key: key);
  final int index;

  @override
  State<_BuildPost> createState() => __BuildPostState();
}

class __BuildPostState extends State<_BuildPost> {
  String firstHalf;
  String secondHalf;
  bool flag = true;

  @override
  void initState() {
    if (kenangans[widget.index].caption.length > 100) {
      firstHalf = kenangans[widget.index].caption.substring(0, 100);
      secondHalf = kenangans[widget.index]
          .caption
          .substring(50, kenangans[widget.index].caption.length);
    } else {
      firstHalf = kenangans[widget.index].caption;
      secondHalf = "";
    }
    super.initState();
  }

  // formatText();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    child: ClipOval(
                      // child: Image(
                      //   width: 50.0,
                      //   height: 50.0,
                      //   image:
                      //       AssetImage(kenangans[widget.index].authorImageUrl),
                      //   fit: BoxFit.cover,
                      // ),
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: kenangans[widget.index].authorImageUrl,
                        placeholder: (context, url) =>
                            // SpinKitFadingCube(
                            //   size: 30,
                            //   color: Colors.white.withOpacity(0.8),
                            // ),
                            Center(
                          child: Image.asset('assets/images/user0.png'),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  kenangans[widget.index].authorName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  kenangans[widget.index].timeAgo,
                ),
              ),
              InkWell(
                onDoubleTap: () => print('Like post'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => ViewPostScreen(post: kenangans[widget.index]),
                  //   ),
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: (kenangans[widget.index].imageUrl) != null
                      ? Container(
                          constraints: BoxConstraints(
                            minHeight: 200,
                            minWidth: double.infinity,
                          ),
                          decoration: BoxDecoration(
                            // color: Colors.black.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0,
                              ),
                            ],
                          ),

                          // child: SpinKitFadingCube(
                          //   size: 30,
                          //   color: Colors.white.withOpacity(0.8),
                          // ),
                          child: ClipRRect(
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
                              imageUrl: kenangans[widget.index].imageUrl,
                              placeholder: (context, url) => SpinKitFadingCube(
                                size: 30,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        )
                      : Center(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.favorite_border),
                              iconSize: 25.0,
                              onPressed: () => print('Like post'),
                            ),
                            Text(
                              '2,515',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(MdiIcons.commentProcessingOutline),
                                  color: Colors.black,
                                  iconSize: 25.0,
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (_) => ViewPostScreen(
                                    //         post: kenangans[index]),
                                    //   ),
                                    // );
                                  },
                                ),
                                Text(
                                  '2,515',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, bottom: 10, right: 20),
                      // child: formatText(),
                      child: Container(
                        child: secondHalf.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: new Text(firstHalf,
                                    style: TextStyle(fontSize: 14)),
                              )
                            : new Column(
                                children: <Widget>[
                                  new Text(
                                    flag
                                        ? (firstHalf + "...")
                                        : (firstHalf + secondHalf),
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  new InkWell(
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: new Text(
                                            flag
                                                ? "Baca Selengkapnya"
                                                : "Lebih Sedikit",
                                            style: new TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        // flag
                                        //     ? Icon(
                                        //         Icons.arrow_drop_down_rounded,
                                        //         size: 30,
                                        //         color: Colors.black
                                        //             .withOpacity(0.5),
                                        //       )
                                        //     : Icon(
                                        //         Icons.arrow_drop_up_rounded,
                                        //         size: 30,
                                        //         color: Colors.black
                                        //             .withOpacity(0.5),
                                        //       )
                                      ],
                                    ),
                                    onTap: () {
                                      setState(() {
                                        flag = !flag;
                                      });
                                      log(flag.toString());
                                    },
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
