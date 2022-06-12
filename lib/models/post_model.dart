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
      authorImageUrl: 'assets/images/user2.png',
      timeAgo: '5 min',
      imageUrl: 'assets/images/post2.jpeg',
      caption: "The best view comes after the hardest climb."),
  Post(
      authorName: 'Sam Martin',
      authorImageUrl: 'assets/images/user2.png',
      timeAgo: '10 min',
      imageUrl: 'assets/images/post3.jpeg',
      caption:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer urna eros, dapibus id est nec, pellentesque vulputate elit. Sed efficitur elit ut justo varius pharetra. Integer gravida neque vitae egestas posuere. Ut ut varius nibh. Quisque lorem massa, lobortis ut elit egestas, rhoncus suscipit lorem. Phasellus a arcu auctor, tincidunt nibh ac, laoreet nunc. Sed non iaculis nisi. Sed ultricies dictum quam. Phasellus id blandit ex, vitae commodo ante."),
];
