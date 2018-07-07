import 'package:flutter/material.dart';

void main() => runApp(new Treasure());

class Treasure extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        margin: EdgeInsets.only(top: 80.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            expandRow(new Item(
                text: "Dogpatch in the scene bruhh",
                distance: 2.0,
                postedAt: new DateTime.now())),
            expandRow(new Item(
                text: "Hey", distance: 2.0, postedAt: new DateTime.now())),
            expandRow(new Item(
                text: "Hey", distance: 2.0, postedAt: new DateTime.now()))
          ],
        ),
      ),
    );
  }
}

Row expandRow(Widget widget) => new Row(
      children: <Widget>[
        Expanded(child: widget),
      ],
    );

class ExpandedRowItem extends StatelessWidget {
  final String text;

  const ExpandedRowItem({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: new Item(text: text)),
      ],
    );
  }
}

class Item extends StatelessWidget {
  final String text;
  final double distance;
  final DateTime postedAt;

  const Item({Key key, this.text, this.distance, this.postedAt})
      : super(key: key);

  static const double spacing = 10.0;

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(
            border:
                new Border(top: BorderSide(color: Colors.black, width: 20.0))),
        margin: const EdgeInsets.fromLTRB(
            spacing * 4, spacing, spacing * 4, spacing),
        padding: const EdgeInsets.only(top: spacing),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Expanded(child: Label(distanceStr())),
                new Label(postedAtStr()),
              ],
            ),
            new Container(
                margin: const EdgeInsets.only(top: spacing, bottom: spacing),
                child: Text(
                  text,
                  textAlign: TextAlign.start,
                ))
          ],
        ));
  }

  String distanceStr() => distance.toString() + " miles away";

  String postedAtStr() => daysAgo().toString() + " days ago";

  int daysAgo() => (DateTime.now().difference(postedAt)).inDays;
}

class Label extends StatelessWidget {
  final String text;
  const Label(this.text);

  @override
  Widget build(BuildContext context) {
    return new Text(text);
  }
}
