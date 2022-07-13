import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram_redesign_ui/constant.dart';
import 'package:instagram_redesign_ui/helper/get_helper.dart';
import 'package:instagram_redesign_ui/models/api_response.dart';
import 'package:instagram_redesign_ui/models/post.dart';
import 'package:instagram_redesign_ui/screens/login_screen.dart';
import 'package:instagram_redesign_ui/services/post_service.dart';
import 'package:instagram_redesign_ui/services/user_service.dart';
import 'package:instagram_redesign_ui/widget/build_post.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final fifteenAgo = DateTime.now().subtract(Duration(minutes: 15));
  final DateTime time1 = DateTime.parse("1987-07-20 20:18:04Z");

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
    // listPost = GetHelper().getAllFeed();
    retrievePosts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(timeago.format(time1));

    // print(timeago.format(fifteenAgo, locale: 'en_short'));

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
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
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: RefreshIndicator(
                  displacement: 10,
                  // edgeOffset: 10,
                  onRefresh: () {
                    return retrievePosts();
                  },
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    // primary: false,
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: _postList.length,
                        itemBuilder: (BuildContext context, int index) {
                          Post post = _postList[index];
                          return BuildPost(
                            authorName: post.user.name,
                            authorImageUrl: baseURLMobile + post.user.image,
                            timeAgo: timeago
                                .format(DateTime.parse(
                                  post.createdAt,
                                ))
                                .toString(),
                            imageUrl: baseURLMobile + post.image,
                            caption: post.body,
                            likesCount: post.likesCount,
                            selfLiked: post.selfLiked,
                            postId: post.id,
                            like: 0,
                            comment: "10",
                          );
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
