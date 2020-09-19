import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/listNews.dart';
import 'package:provider/provider.dart';

class Tabs2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    newsService.selectedCategory = newsService.selectedCategory;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: <Widget>[
          //Mostrar botones de las categorias
          _ListCategories(),
          //Mostrar noticias
          Expanded(
              child: Center(
                  child: ListNews(newsService.getArticleCategorySelected)))
        ],
      )),
    );
  }
}

class _ListCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Category> categories =
        Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 90,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final String nameCategory = categories[index].name;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  _CategoryButton(category: categories[index]),
                  SizedBox(height: 10),
                  Text(
                      '${nameCategory[0].toUpperCase()}${nameCategory.substring(1)}')
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;
  const _CategoryButton({
    @required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    bool selected = newsService.selectedCategory == this.category.name;
    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = this.category.name;
      },
      child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? newsService.selectedColorIcon : Colors.cyan),
          child: Icon(
            category.icon,
            color: selected ? Colors.white : Colors.black,
          )),
    );
  }
}
