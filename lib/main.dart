import 'package:flutter/material.dart';
import 'package:wallpapers_fq/grid_wallpaper.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: new Wallpaper(),
    );
  }
}
