import 'package:flutter/material.dart';
import 'package:newsapp/src/models/article_model.dart';
import 'package:newsapp/src/theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;
  const ListNews(this.news);
  //prueba
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.news.length,
        itemBuilder: (BuildContext context, int index) {
          return _New(singleNew: this.news[index], index: index);
        });
  }
}

class _New extends StatelessWidget {
  final Article singleNew;
  final int index;

  const _New({@required this.singleNew, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CardTopBar(
          singleNew: singleNew,
          index: index,
        ),
        _CardTitle(singleNew: singleNew),
        _CardImage(singleNew: singleNew),
        _CardDescription(singleNew: singleNew),
        _CardFooter(singleNew: singleNew),
        Divider(color: Colors.white),
      ],
    );
  }
}

class _CardFooter extends StatelessWidget {
  final Article singleNew;
  _CardFooter({this.singleNew});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black),
            ),
            colorBrightness: Brightness.dark,
            splashColor: Colors.amber,
            elevation: 6.0,
            color: Colors.red,
            child: Icon(Icons.add_circle_outline),
            onPressed: () => print("Button Pressed"),
            //onPressed: ,
          )
        ],
      ),
    );
  }
}

class _CardDescription extends StatelessWidget {
  final Article singleNew;
  _CardDescription({this.singleNew});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text('${singleNew.description}'),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article singleNew;
  const _CardImage({this.singleNew});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: singleNew.urlToImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
                  /*imageErrorBuilder: (BuildContext context, Object exception,
                      StackTrace stackTrace) {
                    return Container(
                      child: Image.asset('assets/img/no-image.png'),
                    );
                  },*/
                  placeholder: AssetImage('assets/img/giphy.gif'),
                  image: NetworkImage(singleNew.urlToImage)),
            )
          : Image(
              image: AssetImage('assets/img/no-image.png'),
            ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article singleNew;

  const _CardTitle({this.singleNew});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        '${singleNew.title}',
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Article singleNew;
  final int index;

  const _CardTopBar({this.singleNew, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}',
            style: TextStyle(color: myTheme.accentColor),
          ),
          Text(
            '${singleNew.source.name}',
          )
        ],
      ),
    );
  }
}
