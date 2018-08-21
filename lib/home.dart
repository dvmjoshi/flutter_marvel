import 'package:flutter/material.dart';
import 'package:flutter_marvel/main.dart';
import 'model.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final appBar = AppBar(
      elevation: .5,
      leading: IconButton(
icon: Icon(Icons.menu),
        onPressed: (){print('heloo menu');},
      ),
      title: Text('Marvel'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){print("hello search");},
        )
      ],
    );
    ///create book tile hero
    createTile(Marvel marvel) => Hero(
      tag: marvel.title,
      child: Material(
        elevation: 15.0,
        shadowColor: Colors.blueGrey.shade900,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'detail/${marvel.title}');
          },
          child: Image(
            image: AssetImage(marvel.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
    //creating a grid layout
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(crossAxisCount: 3,
            childAspectRatio: 2/3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children:marvel.map((marvel) => createTile(marvel)).toList() ,
          ),
        )
      ],
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBar,
      body: grid,
    );
  }

}