import 'package:flutter/material.dart';
// import 'package:news_app/models/article_model.dart';

class NewsArticleTitle extends StatelessWidget {
  NewsArticleTitle({@required this.snapshot, @required this.index});
  final snapshot;
  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image(
                image: NetworkImage(
                  snapshot.data[index].urlToImage == null
                      ? 'https://res.cloudinary.com/mykb/image/upload/v1620994700/no-image.jpg'
                      : snapshot.data[index].urlToImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      snapshot.data[index].title == null
                          ? ' '
                          : snapshot.data[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Text(
                      snapshot.data[index].author == null
                          ? ' '
                          : snapshot.data[index].author,
                      style: const TextStyle(fontSize: 10.0),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                    Text(
                      snapshot.data[index].description == null
                          ? ' '
                          : snapshot.data[index].description,
                      style: const TextStyle(fontSize: 12.0),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
