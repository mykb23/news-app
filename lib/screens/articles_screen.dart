import 'package:flutter/material.dart';
// import 'package:news_app/widgets/category_selector.dart';

class ArticlesScreen extends StatefulWidget {
  // ArticlesScreen({Key key}) : super(key: key);

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
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
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            // color: Colors.blue,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
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
          Text('Hi'),
        ],
      ),
    );
  }
}
