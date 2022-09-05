import 'package:flutter/material.dart';
import 'MainDrawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.transparent,
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          // Set the transparency here
          canvasColor: Colors.deepPurple.withOpacity(
              0.5), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
        ),
        child: Drawer(
            child: ListView(children: [
          drawerpanel,
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black87,
            ),
            title: Text('HomePage',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.library_add_outlined,
              color: Colors.black87,
            ),
            title: Text('Add Records',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/addrecords');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.my_library_books,
              color: Colors.black87,
            ),
            title: Text('View Records',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/viewrecords');
            },
          ),
        ])),
      ),
      body: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [const Color(0xFF301934), const Color(0xFF8e247d)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'User Management Portal',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )),
    );
  }
}
