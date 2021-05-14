import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final String newsUrl;
  ArticleDetailsScreen({this.newsUrl});
  @override
  _ArticleDetailsScreenState createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.newsUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
