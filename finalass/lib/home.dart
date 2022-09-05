import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          // Set the transparency here
          canvasColor: Colors.blue[600]!.withOpacity(
              0.5), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
        ),
        child: Drawer(
            child: ListView(children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFD500F9),
                    Colors.blue,
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
              backgroundImage: NetworkImage("assets/dp.jpg"),
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
              Navigator.popUntil(context, ModalRoute.withName('/home'));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_1,
              color: Colors.white,
            ),
            title: const Text('Animated Align',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/animatedAlign');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_2,
              color: Colors.white,
            ),
            title: const Text('Animated Builder',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/animatedBuilder');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_3,
              color: Colors.white,
            ),
            title: const Text('Animated Container',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/animatedContainer');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.filter_4,
              color: Colors.white,
            ),
            title: const Text('Animated CrossFade',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                )),
            onTap: () {
              Navigator.popAndPushNamed(context, '/animatedCrossFade');
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
                color:  Colors.pink[300],
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'aa.png',),
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
                       
                        SizedBox(
                          height: 26,
                        ),
                        Text(
                          'Animated Align',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                             fontWeight: FontWeight.w600,
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
                                  context, '/animatedAlign');
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
                color: Colors.blue[800],
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                         'ab.jpg'),
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
                          height: 235,
                        ),
                      
                        Text(
                          'Animated Builder',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                             fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                                  context, '/animatedBuilder');
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
                          'ac.png'),
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
                       
                        SizedBox(
                          height: 44,
                        ),
                        Text(
                          'Animated Container',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                             fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                                  context, '/animatedContainer');
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
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/acf.png'),
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
                        
                        SizedBox(
                          height: 44,
                        ),
                        Text(
                          'Animated CrossFade',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                             fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                                  context, '/animatedCrossFade');
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
