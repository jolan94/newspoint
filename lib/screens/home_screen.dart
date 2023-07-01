import 'package:flutter/material.dart';
import 'package:newspoint/models/news_model.dart';
import 'package:newspoint/screens/news_categories_screen.dart';
import 'package:newspoint/screens/news_details_screen.dart';
import 'package:newspoint/services/global_data.dart';
import 'package:newspoint/services/news_service.dart';
import 'package:newspoint/widgets/news_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<News> newsList = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  void _fetchNews() async {
    List<News> fetchedNews = await NewsService.fetchNews();
    setState(() {
      newsList = fetchedNews;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('News Point'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NewsCategoriesScreen(),
                    ),
                  );
                },
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "News Category",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          selectedCategory,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  News news = newsList[index];
                  return NewsItem(
                    news: news,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NewsDetailScreen(news: news),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }
}
