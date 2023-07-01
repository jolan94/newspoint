import 'package:flutter/material.dart';
import 'package:newspoint/screens/home_screen.dart';
import 'package:newspoint/services/global_data.dart';

class NewsCategoriesScreen extends StatelessWidget {
  const NewsCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String category = categories[index];
          return Card(
            elevation: 0,
            color: Colors.grey.shade100,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(category),
              leading: const Icon(Icons.list_alt_rounded),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                selectedCategory = categories[index];
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
