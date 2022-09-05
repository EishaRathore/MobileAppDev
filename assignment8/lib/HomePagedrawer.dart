import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue[800],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          // Set the transparency here
          canvasColor: Colors.indigo.withOpacity(
              0.5), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
        ),
        child: Drawer(
            child: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 80, 10, 0),
          ),
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: Colors.white,
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
              Icons.looks_one_outlined,
              color: Colors.white,
            ),
            title: Text('Part 1',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/part_1');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.looks_two_outlined,
              color: Colors.white,
            ),
            title: Text('Part 2',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/part_2');
            },
          ),
        ])),
      ),
      body: Container(
          decoration: new BoxDecoration(color: Colors.black),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tab Bar App Demonstrated with\nButtons and Input & Selection \nWidgets Demo',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )),
    );
  }
}
