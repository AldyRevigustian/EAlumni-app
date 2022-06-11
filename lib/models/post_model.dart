class Post {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;
  String caption;

  Post({
    this.authorName,
    this.authorImageUrl,
    this.timeAgo,
    this.imageUrl,
    this.caption,
  });
}

final List<Post> posts = [
  Post(
      authorName: 'Sam Martin',
      authorImageUrl: 'assets/images/user0.png',
      timeAgo: '5 min',
      imageUrl: 'assets/images/post2.jpeg',
      caption: "Hello World"),
  Post(
      authorName: 'Sam Martin',
      authorImageUrl: 'assets/images/user0.png',
      timeAgo: '10 min',
      imageUrl: 'assets/images/post3.jpeg',
      caption: "Hello World"),
];

// final List<String> stories = [
//   'assets/images/user1.png',
//   'assets/images/user2.png',
//   'assets/images/user3.png',
//   'assets/images/user4.png',
//   'assets/images/user0.png',
//   'assets/images/user1.png',
//   'assets/images/user2.png',
//   'assets/images/user3.png',
// ];
