import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/constants/constant.dart';
import 'package:newsapp/src/models/article_model.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_model.dart';

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  final _selectedColorIcon = Colors.red;
  Map<String, List<Article>> categoryArticles = {};
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.compactDisc, 'technology'),
  ];
  //business entertainment general health science sports technology

  NewsService() {
    this.getTopHeadlines();
    this.categories.forEach((element) {
      this.categoryArticles[element.name] = List<Article>();
    });
  }

  get selectedCategory => this._selectedCategory;

  get selectedColorIcon => this._selectedColorIcon;

  set selectedCategory(String category) {
    this._selectedCategory = category;
    this.getArticlesByCategory(category);
    notifyListeners();
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

  getArticlesByCategory(String category) async {
    if (this.categoryArticles[category].length > 0)
      return this.categoryArticles[category];
    //Contruyo la url
    final String url =
        '$urlNews$topHeadlines?country=ve&apiKey=$apiKey&languaje=es&category=$category';
    //Realizo peticion http
    final resp = await http.get(url);
    //Obtengo respuesta
    final newsResponse = newsFromJson(resp.body);
    //Asigno el resultado
    this.categoryArticles[category].addAll(newsResponse.articles);
    //Notifico a los listeners
    notifyListeners();
  }
}
