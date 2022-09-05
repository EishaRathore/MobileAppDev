import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
      home: MyHomePage(
        title: 'Flutter Card App',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        /** Card Widget **/
        child: Card(
          elevation: 30,
          shadowColor: Colors.black,
          color: Colors.greenAccent[100],
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("../assets/background-image.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            width: 350,
            height: 420,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    'If You Truly Love Nature, You\'ll find beauty everywhere.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green[900],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '-Von Gogh',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green[900],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 120,
                    child: RaisedButton(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Icon(Icons.touch_app_outlined),
                            Text('Message'),
                          ],
                        ),
                      ),
                      onPressed: () {
                        showAlertDialog(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FontAwesomeIcons.facebook,
                        ),
                        Icon(
                          FontAwesomeIcons.instagram,
                        ),
                        Icon(
                          FontAwesomeIcons.twitter,
                        ),
                        Icon(
                          FontAwesomeIcons.pinterest,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Eisha Nawaz"),
              accountEmail: Text("eisha@gmail.com"),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("../assets/dp.jpg"),
              ),
            ),
            new ListTile(
              leading: Icon(
                Icons.mail,
                color: Colors.red,
                size: 50.0,
              ),
              title: new Text("Todays"),
            ),
            Divider(),
            new ListTile(
              title: new Text("Products"),
              leading: Icon(
                Icons.gradient,
                color: Colors.grey,
                size: 22.0,
              ),
            ),
            new ListTile(
              title: new Text("Direct Materials"),
              leading: Icon(
                Icons.people_sharp,
                color: Colors.grey,
                size: 22.0,
              ),
            ),
            new ListTile(
              title: new Text("Direct Labour"),
              leading: Icon(
                Icons.local_offer_rounded,
                color: Colors.grey,
                size: 22.0,
              ),
            ),
            new ListTile(
              title: new Text("Overheads"),
              leading: Icon(
                Icons.local_offer_rounded,
                color: Colors.grey,
                size: 22.0,
              ),
            ),
            new ListTile(
              title: new Text("Customers"),
              leading: Icon(
                Icons.people_sharp,
                color: Colors.grey,
                size: 22.0,
              ),
            ),
            new ListTile(
              title: new Text("Suppliers"),
              leading: Icon(
                Icons.people_sharp,
                color: Colors.grey,
                size: 22.0,
              ),
            ),
            Divider(
              thickness: 5,
            ),
            new ListTile(
              title: new Text("Consultant"),
              leading: Icon(
                Icons.people_sharp,
                color: Colors.grey,
                size: 22.0,
              ),
            ),
            new ListTile(
              title: new Text("Help"),
              leading: Icon(
                Icons.help,
                color: Colors.grey,
                size: 22.0,
              ),
            ),
            new ListTile(
              title: new Text("Settings"),
              leading: Icon(
                Icons.settings,
                color: Colors.grey,
                size: 22.0,
              ),
            ),
            new ListTile(
              title: new Text("LogOut"),
              leading: Icon(
                Icons.logout,
                color: Colors.grey,
                size: 22.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(
        color: Colors.green[400],
      ),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Nature",
      style: TextStyle(
        color: Colors.green[700],
        fontWeight: FontWeight.w600,
      ),
    ),
    content: Text(
      " This Image Defines the Beauty of Nature.",
      style: TextStyle(
        color: Colors.green[700],
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
