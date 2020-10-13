import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/listNews.dart';
import 'package:provider/provider.dart';

class Tabs1Page extends StatefulWidget {
  @override
  _Tabs1PageState createState() => _Tabs1PageState();
}

class _Tabs1PageState extends State<Tabs1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final headlines = Provider.of<NewsService>(context).headlines;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: headlines.length != 0
          ? Center(child: ListNews(headlines))
          : Center(child: CircularProgressIndicator()),
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
