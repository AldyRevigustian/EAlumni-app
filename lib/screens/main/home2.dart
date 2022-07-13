import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram_redesign_ui/constant.dart';
import 'package:instagram_redesign_ui/helper/get_helper.dart';
import 'package:instagram_redesign_ui/models/api_response.dart';
import 'package:instagram_redesign_ui/screens/login_screen.dart';
import 'package:instagram_redesign_ui/services/post_service.dart';
import 'package:instagram_redesign_ui/services/user_service.dart';
import 'package:instagram_redesign_ui/widget/build_post.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future listPost;
  List<dynamic> _postList = [];
  int userId = 0;

  // get all posts
  Future<void> retrievePosts() async {
    userId = await getUserId();
    ApiResponse response = await getPosts();

    if (response.error == null) {
      setState(() {
        _postList = response.data as List<dynamic>;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

  void _handlePostLikeDislike(int postId) async {
    ApiResponse response = await likeUnlikePost(postId);

    if (response.error == null) {
      retrievePosts();
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    listPost = GetHelper().getAllFeed();
    retrievePosts();

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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        'SMKN 10',
                        style: TextStyle(
                          fontFamily: 'Proxima',
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 2, 2, 2),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Cari Teman",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          )
                        ],
                      ),
                    ),
                    // color: Colors.white,
                  )
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
                                                  "berita"
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
