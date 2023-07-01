import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newspoint/models/news_model.dart';
import 'package:newspoint/services/global_data.dart';

class NewsService {
  static Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://inshortsnews-rouge.vercel.app/news?category=$selectedCategory'));
    if (response.statusCode == 200) {
      final jsonTemp = json.decode(response.body);
      final jsonData = jsonTemp['data'];
      List<News> newsList = [];
      for (var item in jsonData) {
        News news = News.fromJson(item);
        newsList.add(news);
      }
      return newsList;
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}
