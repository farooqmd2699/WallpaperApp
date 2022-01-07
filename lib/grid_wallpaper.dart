import 'dart:convert';
import 'package:wallpapers_fq/my_drawer.dart';

import 'fullscreen.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Wallpaper extends StatefulWidget {
  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  List images = [];
  int page = 1;
  fetchapiwall() async {
    String url =
        "https://api.unsplash.com/search/photos?per_page=100&client_id=2YebcPH0C-AWviBY8ymXOeU4zBKnIMq_dGaog55YszU&query=random";
    await http
        .get(
      Uri.parse(url),
    )
        .then((value) {
      //print(value.body);
      Map result = jsonDecode(value.body);
      //print(result);
      setState(() {
        images = result['results'];
        //print(images);
      });
    });
  }

  loadmore() {
    setState(() async {
      page = page + 1;
      String url = "https://api.unsplash.com/search/photos?per_page=100&page=" +
          page.toString() +
          "&client_id=2YebcPH0C-AWviBY8ymXOeU4zBKnIMq_dGaog55YszU&query=random";
      await http.get(Uri.parse(url)).then((value) {
        //print(value.body);
        Map result = jsonDecode(value.body);
        setState(() {
          images.addAll(result['results']);
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchapiwall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "WALLPAPER APP",
        style: TextStyle(fontFamily: "lr", fontSize: 20, color: Colors.amber),
      )),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 2,
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullScreen(
                                    imageurl: images[index]['urls']['raw'],
                                  )));
                    },
                    child: Container(
                      color: Colors.amber,
                      child: Image.network(
                        images[index]['urls']["thumb"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          InkWell(
            onTap: () {
              loadmore();
            },
            child: Container(
              color: Colors.black,
              width: double.infinity,
              height: 60,
              child: Center(
                child: Text(
                  "Load more",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
