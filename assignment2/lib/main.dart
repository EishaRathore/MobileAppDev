import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Drawer'),
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
           title: Text(widget.title),
            backgroundColor: Colors.blue,
      ),
      
     drawer: Drawer(
    
 child: ListView(

    children: <Widget>[
      UserAccountsDrawerHeader(
      accountName: Text("Eisha Nawaz"),
      accountEmail: Text("eisha@gmail.com"),
      currentAccountPicture: CircleAvatar(
      backgroundImage: NetworkImage(
        "../assets/dp.jpg"
         ),
       ),
      ),
      new ListTile(
      leading: Icon(Icons.mail,
       color: Colors.red,
      size: 50.0,
    ),
        title: new Text("Todays"),
        
      ), 
      Divider(),
        new ListTile(
        title: new Text("Products"),
        leading: Icon(Icons.gradient,
      color: Colors.grey,
      size: 22.0,),
      ),
       new ListTile(
        title: new Text("Direct Materials"),
        leading: Icon(Icons.people_sharp,
      color: Colors.grey,
      size: 22.0,),
      ),
        new ListTile(
        title: new Text("Direct Labour"),
        leading: Icon(Icons.local_offer_rounded,
      color: Colors.grey,
      size: 22.0,),
      ),
       new ListTile(
        title: new Text("Overheads"),
        leading: Icon(Icons.local_offer_rounded,
      color: Colors.grey,
      size: 22.0,),
      ),
       new ListTile(
        title: new Text("Customers"),
        leading: Icon(Icons.people_sharp,
      color: Colors.grey,
      size: 22.0,),
      ),
      
       new ListTile(
        title: new Text("Suppliers"),
        leading: Icon(Icons.people_sharp,
      color: Colors.grey,
      size: 22.0,),
      ),
     Divider(
       thickness: 5,
     ),
      new ListTile(
        title: new Text("Consultant"),
        leading: Icon(Icons.people_sharp,
      color: Colors.grey,
      size: 22.0,),
      ),
       new ListTile(
        title: new Text("Help"),
        leading: Icon(Icons.help,
      color: Colors.grey,
      size: 22.0,),
      ),
      new ListTile(
        
        title: new Text("Settings"),
        leading: Icon(Icons.settings,
      color: Colors.grey,
      size: 22.0,),
      ),
      
      
       new ListTile(
        title: new Text("LogOut"),
        leading: Icon(Icons.logout,
      color: Colors.grey,
      size: 22.0,),
      ),
       
    ],
    
  ),
),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
