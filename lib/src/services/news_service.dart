import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/constants/constant.dart';
import 'package:newsapp/src/models/article_model.dart';
import 'package:newsapp/src/models/news_model.dart';

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    //Contruyo la url
    final String url =
        '$urlNews$topHeadlines?country=ve&apiKey=$apiKey&languaje=es';
    //Realizo peticion http
    final resp = await http.get(url);
    //Obtengo respuesta
    final newsResponse = newsFromJson(resp.body);
    //Asigno el resultado
    this.headlines.addAll(newsResponse.articles);
    //Notifico a los listeners
    notifyListeners();
  }
}
