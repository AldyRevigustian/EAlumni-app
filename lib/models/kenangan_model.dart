class Kenangan {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;
  String caption;

  Kenangan({
    this.authorName,
    this.authorImageUrl,
    this.timeAgo,
    this.imageUrl,
    this.caption,
  });
}

final List<Kenangan> kenangans = [
  Kenangan(
      authorName: 'Aldy',
      authorImageUrl: 'assets/images/user1.png',
      timeAgo: '5 min',
      imageUrl: 'assets/images/post2.jpeg',
      caption: "The best view comes after the hardest climb."),
  Kenangan(
      authorName: 'Revi',
      authorImageUrl: 'assets/images/user3.png',
      timeAgo: '10 min',
      imageUrl: 'assets/images/post1.jpg',
      caption:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer urna eros, dapibus id est nec, pellentesque vulputate elit. Sed efficitur elit ut justo varius pharetra. Integer gravida neque vitae egestas posuere. Ut ut varius nibh. Quisque lorem massa, lobortis ut elit egestas, rhoncus suscipit lorem. Phasellus a arcu auctor, tincidunt nibh ac, laoreet nunc. Sed non iaculis nisi. Sed ultricies dictum quam. Phasellus id blandit ex, vitae commodo ante."),
  Kenangan(
      authorName: 'Gustian',
      authorImageUrl: 'assets/images/user4.png',
      timeAgo: '10 min',
      imageUrl: 'assets/images/post4.jpg',
      caption:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer urna eros, dapibus id est nec, pellentesque vulputate elit. Sed efficitur elit ut justo varius pharetra. Integer gravida neque vitae egestas posuere. Ut ut varius nibh. Quisque lorem massa, lobortis ut elit egestas, rhoncus suscipit lorem. Phasellus a arcu auctor, tincidunt nibh ac, laoreet nunc. Sed non iaculis nisi. Sed ultricies dictum quam. Phasellus id blandit ex, vitae commodo ante."),
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
