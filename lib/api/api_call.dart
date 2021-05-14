import 'dart:convert';
import 'dart:io';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/failure.dart';

class ApiCallClass {
  Future<List<ArticleElement>> getNews() async {
    try {
      final news = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?sources=bbc-news&apiKey=f6f3ef984d4241f8aadac7e1adba5ec3'));
      if (news.statusCode == 200) {
        final Iterable rawJson = jsonDecode(news.body)['articles'];
        return rawJson
            .map((article) => ArticleElement.fromJson(article))
            .toList();
      } else {
        throw Failure(message: news.body.toString());
      }
    } on SocketException {
      throw Failure(message: 'You are not connected to the internet');
    } catch (error) {
      // print(error);
      // throw error.toString();
      throw Failure(message: error.toString());
    }
  }

  Future<List<ArticleElement>> getNewsByCategory(String category) async {
    try {
      final news = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f6f3ef984d4241f8aadac7e1adba5ec3"));
      if (news.statusCode == 200) {
        final Iterable rawJson = jsonDecode(news.body)['articles'];
        return rawJson
            .map((article) => ArticleElement.fromJson(article))
            .toList();
      } else {
        throw Failure(message: news.body.toString());
      }
    } on SocketException {
      throw Failure(message: 'You are not connected to the internet');
    } catch (error) {
      // print(error);
      // throw error.toString();
      throw Failure(message: error.toString());
    }
  }
}
