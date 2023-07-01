import 'package:flutter/material.dart';
import 'package:newspoint/models/news_model.dart';

class NewsItem extends StatelessWidget {
  final News news;
  final VoidCallback onTap;

  NewsItem({required this.news, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      color: Colors.grey.shade100,
      child: ListTile(
        leading: Image.network(
          news.imageUrl,
          width: 75,
          fit: BoxFit.fill,
        ),
        title: Text(
          news.title,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text("${news.date} ${news.time}"),
        visualDensity: VisualDensity.comfortable,
        onTap: onTap,
      ),
    );
  }
}
