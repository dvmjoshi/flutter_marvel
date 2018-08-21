import 'package:flutter/material.dart';
import 'package:flutter_marvel/detail.dart';
import 'package:flutter_marvel/home.dart';
import 'package:flutter_marvel/model.dart';

void main ()=> runApp (new Marvels());

class Marvels extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title : 'Marvels',
      debugShowCheckedModeBanner: false,
      theme:  new ThemeData(

        primarySwatch: Colors.blueGrey,
        platform: TargetPlatform.android,
      ),
      home: Home(),
onGenerateRoute: (settings)=>generateRoute(settings),
    );
  }
  generateRoute(RouteSettings settings){
    final path = settings.name.split('/');
    final title = path[1];

    Marvel marvels = marvel.firstWhere((it) => it.title == title);
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => Detail(marvels),
    );
  }

}