import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:instagram_redesign_ui/screens/main/post/add_post.dart';
import 'package:photo_manager/photo_manager.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Widget> _mediaList = [];
  int currentPage = 0;
  int lastPage;
  Uint8List picked;
  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }

  _fetchNewMedia() async {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    lastPage = currentPage;
    var result = await PhotoManager.requestPermission();
    if (result) {
      // success
//load the album list
      List<AssetPathEntity> albums =
          await PhotoManager.getAssetPathList(onlyAll: true);
      print(albums);
      List<AssetEntity> media =
          await albums[0].getAssetListPaged(currentPage, 10000000);
      print(media);
      List<Widget> temp = [];
      for (var asset in media) {
        if (asset.type == AssetType.image) {
          temp.add(FutureBuilder(
            future: asset.thumbDataWithSize(500, 500),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          // log("Pick");
                          // log(snapshot.data.toString());
                          setState(() {
                            picked = snapshot.data;
                          });
                        },
                        child: Image.memory(
                          snapshot.data,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              return Container();
            },
          ));
        }
      }
      setState(() {
        _mediaList.addAll(temp);
        currentPage++;
      });
    } else {
      PhotoManager.openSetting();
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scroll) {
        _handleScrollEvent(scroll);
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "Post",
              style: TextStyle(
                  color: Colors.black, fontFamily: "Billabong", fontSize: 30),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            //     child: Text(
            //       "Next",
            //       style: TextStyle(color: Colors.blue, fontFamily: "Proxima"),
            //     ),
            //   ),
            // )
            GestureDetector(
              onTap: () {
                if (picked != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddPost(image: picked),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: picked != null
                      ? Colors.black
                      : Colors.black.withOpacity(0.3),
                  size: 20,
                ),
              ),
            )
          ],
          // leading: Text,
        ),
        body: Column(
          children: [
            Container(
              height: 10,
              color: Colors.white,
            ),
            Container(
              color: Colors.white,
              height: height / 2.4,
              width: width,
              child: (picked != null)
                  ? Image.memory(
                      picked,
                      fit: BoxFit.contain,
                    )
                  : Center(
                      child: Text(
                      "Pick Image",
                      style: TextStyle(
                        fontFamily: "Proxima",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )),
            ),
            Container(
              height: 10,
              color: Colors.white,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: _mediaList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return _mediaList[index];
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
