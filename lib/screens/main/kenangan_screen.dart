import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram_redesign_ui/helper/get_helper.dart';
import 'package:instagram_redesign_ui/widget/build_post.dart';

class KenanganScreen extends StatefulWidget {
  @override
  _KenanganScreenState createState() => _KenanganScreenState();
}

class _KenanganScreenState extends State<KenanganScreen> {
  Future listPost;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    listPost = GetHelper().getAllFeed();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                        fontFamily: 'Proxima',
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                // physics: AlwaysScrollableScrollPhysics(),
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: FutureBuilder(
                      future: listPost,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot snapshot,
                      ) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: height / 1.4),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SpinKitFadingCube(
                                    size: 30,
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Loading ...",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.2),
                                          fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const Text('Error');
                          } else if (snapshot.hasData) {
                            return snapshot.data.isEmpty
                                ? ConstrainedBox(
                                    constraints:
                                        BoxConstraints(minHeight: height / 1.4),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // SpinKitFadingCube(
                                          //   size: 30,
                                          //   color: Colors.black.withOpacity(0.2),
                                          // ),
                                          Icon(
                                            Icons.error,
                                            size: 40,
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              "No Post Available",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  fontSize: 15),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: snapshot.data[index].type ==
                                                  "kenangan"
                                              ? BuildPost(
                                                  authorName: snapshot
                                                      .data[index].authorName,
                                                  authorImageUrl: snapshot
                                                      .data[index]
                                                      .authorImageUrl,
                                                  timeAgo: snapshot
                                                      .data[index].timeAgo,
                                                  imageUrl: snapshot
                                                      .data[index].imageUrl,
                                                  caption: snapshot
                                                      .data[index].caption,
                                                  like:
                                                      snapshot.data[index].like,
                                                  comment: snapshot
                                                      .data[index].comment,
                                                )
                                              : Center());
                                    },
                                  );
                          } else {
                            return Center(
                              child: Text(
                                'Empty data',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          }
                        } else {
                          return Text('State: ${snapshot.connectionState}');
                        }
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
