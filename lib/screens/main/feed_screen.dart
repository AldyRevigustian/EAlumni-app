import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_redesign_ui/models/post_model.dart';
import 'package:instagram_redesign_ui/screens/main/view_post_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  Widget _buildPost(int index) {
    String firstHalf;
    String secondHalf;

    bool flag = true;

    formatText(String author, String text) {
      if (text.length > 50) {
        firstHalf = text.substring(0, 50);
        secondHalf = text.substring(50, text.length);
      } else {
        firstHalf = text;
        secondHalf = "";
      }
      return RichText(
        text: new TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Proxima",
            fontWeight: FontWeight.normal,
          ),
          children: <TextSpan>[
            new TextSpan(
                text: author + "  ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            new TextSpan(
              text: posts[index].caption,
            ),
          ],
        ),
      );
    }

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
                      child: Image(
                        width: 50.0,
                        height: 50.0,
                        image: AssetImage(posts[index].authorImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  posts[index].authorName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  posts[index].timeAgo,
                ),
              ),
              InkWell(
                onDoubleTap: () => print('Like post'),
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => ViewPostScreen(post: posts[index]),
                //     ),
                //   );
                // },
                // child: Container(
                //     margin: EdgeInsets.all(10.0),
                //     width: double.infinity,
                //     height: height / 3,
                //     decoration: AssetImage(posts[index].imageUrl) != null
                //         ? BoxDecoration(
                //             borderRadius: BorderRadius.circular(25.0),
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.black45,
                //                 offset: Offset(0.0, 8.0),
                //                 blurRadius: 8.0,
                //               ),
                //             ],
                //             image: DecorationImage(
                //               image: AssetImage(posts[index].imageUrl),
                //               fit: BoxFit.cover,
                //             ),
                //           )
                //         : Center(
                //             child: CircularProgressIndicator(),
                //           )),

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: (posts[index].imageUrl) != null
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            child: Image.asset(posts[index].imageUrl),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            ViewPostScreen(post: posts[index]),
                                      ),
                                    );
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
                            top: 10, left: 10, bottom: 20),
                        child: Container(
                          width: width / 1.2,
                          child: Text(
                            posts[index].caption,
                            style: TextStyle(fontFamily: "Proxima"
                                // fontWeight: FontWeight.bold,
                                ),
                          ),
                        )

                        // child: ReadMoreText(
                        //   "sadasdasdasdsadas",
                        //   trimLines: 10,
                        //   colorClickableText: Colors.black,
                        //   trimMode: TrimMode.Line,
                        //   trimCollapsedText: 'Show more',
                        //   trimExpandedText: 'Show less',
                        //   moreStyle: TextStyle(
                        //       fontSize: 14, fontWeight: FontWeight.bold),
                        // )),
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

  List<Widget> _buildPosts() {
    List<Widget> postWidgets = List<Widget>();
    for (int i = 0; i < posts.length; i++) {
      postWidgets.add(_BuildPost(index: i));
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
                      'Berita',
                      style: TextStyle(
                        fontFamily: 'Billabong',
                        fontSize: 30.0,
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
    if (posts[widget.index].caption.length > 100) {
      firstHalf = posts[widget.index].caption.substring(0, 100);
      secondHalf = posts[widget.index]
          .caption
          .substring(50, posts[widget.index].caption.length);
    } else {
      firstHalf = posts[widget.index].caption;
      secondHalf = "";
    }
    super.initState();
  }

  // formatText();
  @override
  Widget build(BuildContext context) {
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
                      child: Image(
                        width: 50.0,
                        height: 50.0,
                        image: AssetImage(posts[widget.index].authorImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  posts[widget.index].authorName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  posts[widget.index].timeAgo,
                ),
              ),
              InkWell(
                onDoubleTap: () => print('Like post'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => ViewPostScreen(post: posts[widget.index]),
                  //   ),
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: (posts[widget.index].imageUrl) != null
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            child: Image.asset(posts[widget.index].imageUrl),
                            borderRadius: BorderRadius.circular(20),
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
                                    //         post: posts[index]),
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
