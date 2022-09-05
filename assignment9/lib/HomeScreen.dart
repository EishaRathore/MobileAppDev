import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.cyan[900],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          // Set the transparency here
          canvasColor: Colors.cyan[900]!.withOpacity(
              0.5), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
        ),
        child: Drawer(
            child: ListView(children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFD500F9),
                    Color(0xFF006064),
                  ],
                  begin: const FractionalOffset(0.0, 1.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            accountName: Text(
              "Eisha Nawaz",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              "eisha@gmail.com",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("../assets/dp.jpg"),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            title: const Text('HomePage',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_1,
              color: Colors.white,
            ),
            title: const Text('Assignment 1',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/assignment1');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_2,
              color: Colors.white,
            ),
            title: const Text('Assignment 2',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/assignment2');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_3,
              color: Colors.white,
            ),
            title: const Text('Assignment 3',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/assignment3');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_4,
              color: Colors.white,
            ),
            title: const Text('Assignment 4',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/assignment4');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_5,
              color: Colors.white,
            ),
            title: const Text('Assignment 5',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/assignment5');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_6,
              color: Colors.white,
            ),
            title: const Text('Assignment 6',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/assignment6');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_7,
              color: Colors.white,
            ),
            title: const Text('Assignment 7',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/assignment7');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_8,
              color: Colors.white,
            ),
            title: const Text('Assignment 8',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/assignment8');
            },
          ),
        ])),
      ),
      body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
              Colors.white,
              Color(0xFF80DEEA),
            ], stops: [
              0.0,
              1.0
            ], tileMode: TileMode.clamp),
          ),
          child: ListView(children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 30,
                shadowColor: Colors.black,
                color: Colors.teal,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'prime-and-composite-numbers-l.jpg'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: 350,
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 200,
                        ),
                        Text(
                          'Assignment 1',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Calculate Prime or Composite Number',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 95,
                          child: RaisedButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app_outlined),
                                  Text('Open'),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, '/assignment1');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 30,
                shadowColor: Colors.black,
                color: Colors.red[800],
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                         'assets/images.png'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: 350,
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Text(
                          'Assignment 2',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Flutter Drawer App',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 100,
                          child: RaisedButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app_outlined),
                                  Text('Open'),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, '/assignment2');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 30,
                shadowColor: Colors.black,
                color: Colors.yellow[700],
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/w.png'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: 350,
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Text(
                          'Assignment 3',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Card, Alert Dialog, Icon & Image Widgets',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 100,
                          child: RaisedButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app_outlined),
                                  Text('Open'),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, '/assignment3');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 30,
                shadowColor: Colors.black,
                color: Colors.blue[400],
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/Flutter-Widgets.png'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: 350,
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Text(
                          'Assignment 4',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'DropdownButton, ToggleButton & CheckboxListTile',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 100,
                          child: RaisedButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app_outlined),
                                  Text('Open'),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, '/assignment4');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 30,
                shadowColor: Colors.black,
                color: Colors.cyan[400],
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/ico.jpg'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: 350,
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Text(
                          'Assignment 5',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'WEB API Integration',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 100,
                          child: RaisedButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app_outlined),
                                  Text('Open'),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, '/assignment5');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 30,
                shadowColor: Colors.black,
                color: Colors.purple[800],
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/i.jpg'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: 350,
                  height: 390,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Text(
                          'Assignment 6',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            'Capture Image from mobile camera or gallery, \nshow and upload on web-server via REST API',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 100,
                          child: RaisedButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app_outlined),
                                  Text('Open'),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, '/assignment6');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 30,
                shadowColor: Colors.black,
                color: Colors.deepPurple[300],
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/App-Development.jpg'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: 350,
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Text(
                          'Assignment 7',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Flutter Forms',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 100,
                          child: RaisedButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app_outlined),
                                  Text('Open'),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, '/assignment7');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Card(
                elevation: 30,
                shadowColor: Colors.black,
                color: Colors.blue[900],
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/Development.jpg'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: 350,
                  height: 370,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Text(
                          'Assignment 8',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            'Tab Bar App',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 100,
                          child: RaisedButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.touch_app_outlined),
                                  Text('Open'),
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, '/assignment8');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
