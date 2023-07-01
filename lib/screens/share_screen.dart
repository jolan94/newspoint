import 'package:flutter/material.dart';
import 'package:newspoint/models/news_model.dart';
import 'package:share_plus/share_plus.dart';

class ShareScreen extends StatelessWidget {
  final News news;

  ShareScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(news.imageUrl),
            const SizedBox(height: 16),
            Text(
              news.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Share.share(news.url);
              },
              child: const Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}
