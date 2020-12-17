

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  title: 'my app',
  home: MyScaffold()
));


class MyAppBar extends StatelessWidget{
  MyAppBar({this.title});

  final Widget title;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.orangeAccent),
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null
          ),
          new Expanded(
              child: title
          ),
          new IconButton(icon: new Icon(
              Icons.search),
              tooltip: 'search',
              onPressed: null)
        ],

      ),
    );
  }

}


class MyScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,

            ),
          ),
          new Expanded(
              child: new Center(
                child: new Text('Hello world'),
              )
          )
        ],
      ),
    );
  }
}
