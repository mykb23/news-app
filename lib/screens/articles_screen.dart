import 'package:flutter/material.dart';
import 'package:news_app/api/api_call.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_articles_tile.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  final news = ApiCallClass().getNews();
  var newsByCategory;
  int selectedIndex = 0;
  List<String> categories = [
    "All news",
    "Business",
    "Entertainment",
    "Technology",
    "Sports",
    "Health",
    "Science"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    if (categories[index] == "All news") {
                      newsByCategory = ApiCallClass().getNews();
                    } else {
                      newsByCategory =
                          ApiCallClass().getNewsByCategory(categories[index]);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: index == selectedIndex
                          ? const BoxDecoration(
                              border: Border(
                                top: BorderSide.none,
                                left: BorderSide.none,
                                right: BorderSide.none,
                                bottom: BorderSide(
                                  color: Colors.amber,
                                  width: 4.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            )
                          : null,
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: index == selectedIndex
                              ? Colors.black
                              : Colors.grey,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Text('Hi'),
          Expanded(
            child: FutureBuilder<List<ArticleElement>>(
                future: newsByCategory == null ? news : newsByCategory,
                builder:
                    (context, AsyncSnapshot<List<ArticleElement>> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () => print(index),
                          child: NewsArticleTitle(
                              snapshot: snapshot, index: index)),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
