import 'package:flutter_marvel/rating_bar.dart';

import 'model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marvel/model.dart';

class Detail extends StatelessWidget {
  final Marvel marvel;
Detail(this.marvel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final appBar =AppBar(
      elevation: .5,
      title: Text('your hero'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},

        )

      ],
    );
    // detail body
    final topleft =Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
tag: marvel.title,
            child: Material(
              elevation: 15.0,
              shadowColor: Colors.blueGrey.shade900,
child:Image(
    image: AssetImage(marvel.image),
fit: BoxFit.cover,),
            ),
          ),
        ),
        text('${marvel.pages} pages', color: Colors.black38, size: 12)
      ],
    );

    ///detail top right
    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(marvel.title,
            size: 16, isBold: true, padding: EdgeInsets.only(top: 16.0)),
        text(
          'by ${marvel.title}',
          color: Colors.black54,
          size: 12,
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
        ),
        Row(
          children: <Widget>[
            text(
              marvel.power,
              isBold: true,
              padding: EdgeInsets.only(right: 8.0),
            ),
            RatingBar(rating: marvel.rating)
          ],
        ),
        SizedBox(height: 32.0),
        Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.blue.shade200,
          elevation: 5.0,
          child: MaterialButton(
            onPressed: () {},
            minWidth: 160.0,
            color: Colors.blue,
            child: text('BUY IT NOW', color: Colors.white, size: 13),
          ),
        )
      ],
    );

    final topContent = Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topleft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    ///scrolling text description
    final bottomContent = Container(
      height: 220.0,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          marvel.description,
          style: TextStyle(fontSize: 13.0, height: 1.5),
        ),
      ),
    );


    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[topContent,bottomContent],
      ),
    );
  }

  ///create text widget
  text(String data,
      {Color color = Colors.black87,
        num size = 14,
        EdgeInsetsGeometry padding = EdgeInsets.zero,
        bool isBold = false}) =>
      Padding(
        padding: padding,
        child: Text(
          data,
          style: TextStyle(
              color: color,
              fontSize: size.toDouble(),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      );

}
