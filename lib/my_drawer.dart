import 'dart:ui';

import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    final name = "Mohammad Farooq";
    final profileimage = Image.asset("images/img1.jpg");
    return Drawer(
      
      
      child: ListView(
        
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.amber,
            ),
            child: Container(
              height: 100,
              width: 100,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: new NetworkImage(
                          "https://png.pngtree.com/element_origin_min_pic/17/01/06/6f2c1d81bee3ed4ee052479a39b5e472.jpg"))),
              // child: Image.network(
              //     "https://scontent.fvga3-1.fna.fbcdn.net/v/t1.6435-9/117804322_1452942084910811_7857161046392416439_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=174925&_nc_ohc=ikcPnDGJNmkAX_QnCi1&_nc_ht=scontent.fvga3-1.fna&oh=00_AT_md3IUhK2nJjKjVThIlMqdh0orguiaZFKbUkERXf7O3Q&oe=61FDC936")),
            ),
          ),
          Container(
            color: Colors.black87,
            child: ListTile(
              title: Center(
                  child: Text(
                "About Developer",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.amber),
              )),
            ),
          ),
          Container(
            color: Colors.black87,
            child: ListTile(
              title: Center(
                child: Text(
                  "Mohammad Farooq",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                ),
              ),
              leading: Icon(Icons.person),
            ),
          ),
          Container(
            color: Colors.black87,
            child: ListTile(
              title: Center(
                child: Text(
                  "farooqmd2699@gmail.com",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                ),
              ),
              leading: Icon(Icons.mail),
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Center(
                child: Text(
                  'v1.0.1',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )),
          SizedBox(
            height: 225,
          ),
          Material(
            borderRadius: BorderRadius.circular(500),
            child: InkWell(
              borderRadius: BorderRadius.circular(500),
              splashColor: Colors.black45,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: Icon(Icons.arrow_back, color: Colors.amber),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
