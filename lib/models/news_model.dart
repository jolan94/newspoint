class News {
  final String id;
  final String title;
  final String author;
  final String content;
  final String date;
  final String time;
  final String imageUrl;
  final String url;

  News({
    required this.id,
    required this.title,
    required this.author,
    required this.content,
    required this.date,
    required this.time,
    required this.imageUrl,
    required this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      content: json['content'],
      date: json['date'],
      time: json['time'],
      imageUrl: json['imageUrl'],
      url: json['url'],
    );
  }
}
