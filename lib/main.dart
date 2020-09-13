import 'package:flutter/material.dart';
import 'package:newsapp/src/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: myTheme,
      home: PageView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            color: Colors.amber,
            child: Center(child: Text('Pagina 1')),
          ),
          Container(
            color: Colors.green,
            child: Center(child: Text('Pagina 2')),
          )
        ],
      ),
    );
  }
}
