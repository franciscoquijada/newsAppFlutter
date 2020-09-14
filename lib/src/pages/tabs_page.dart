import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(),
      bottomNavigationBar: _Navegacion(),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: 1, items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.accessibility), title: Text("Menu 1")),
      BottomNavigationBarItem(icon: Icon(Icons.adb), title: Text("Menu 2"))
    ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
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
    );
  }
}
