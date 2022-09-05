import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'MainDrawer.dart';

class AddRecords extends StatefulWidget {
  @override
  _AddRecordsState createState() => _AddRecordsState();
}

Future createRecord(
    String first, String last, String gndr, String eml, String phoneNum) async {
  AlertDialog(title: Text("Sample Alert Dialog"));
  var url = 'https://pcc.edu.pk/ws/create/vms_providers.php';
  var data = {
    "firstName": first,
    "lastName": last,
    "gender": gndr,
    "email": eml,
    "phone": phoneNum
  };
  var res = await http.post(Uri.parse(url), body: json.encode(data));

  if (res.statusCode == 201) {
    throw Exception(jsonDecode(res.body));
    // return Service.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Falied to add data');
//    return null;
  }
}

class _AddRecordsState extends State<AddRecords> {
  String fName = "";
  String lName = "";
  String emailAdress = "";
  String sex = "";
  String phoneNum = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        title: Text('Add Records'),
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
              colors: [const Color(0xFF301934), const Color(0x5e247d)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                child: new TextField(
                  style: TextStyle(color: Colors.white60),
                  decoration: new InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "First Name",
                    labelStyle: new TextStyle(color: Colors.white70),
                  ),
                  onChanged: (value) => {
                    fName = value,
                  },
                ),
              )
            ]),
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                child: new TextField(
                  style: TextStyle(color: Colors.white60),
                  decoration: new InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "Last Name",
                    labelStyle: new TextStyle(color: Colors.white70),
                  ),
                  onChanged: (value) => {
                    lName = value,
                  },
                ),
              )
            ]),
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                child: new TextField(
                  style: TextStyle(color: Colors.white60),
                  decoration: new InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "Gender",
                    labelStyle: new TextStyle(color: Colors.white70),
                  ),
                  onChanged: (value) => {
                    sex = value,
                  },
                ),
              )
            ]),
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                child: new TextField(
                  style: TextStyle(color: Colors.white60),
                  decoration: new InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "Email",
                    labelStyle: new TextStyle(color: Colors.white70),
                  ),
                  onChanged: (value) => {
                    emailAdress = value,
                  },
                ),
              )
            ]),
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                child: new TextField(
                  style: TextStyle(color: Colors.white60),
                  decoration: new InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: "Phone Number",
                    labelStyle: new TextStyle(color: Colors.white70),
                  ),
                  onChanged: (value) => {
                    phoneNum = value,
                  },
                ),
              )
            ]),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  child: Text('Add Records'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    onPrimary: Colors.white,
                    primary: Colors.transparent,
                    elevation: 5,
                  ),
                  onPressed: () async {
                    final String first = fName;
                    final String last = lName;
                    final String gndr = sex;
                    final String eml = emailAdress;
                    final String number = phoneNum;
                    createRecord(first, last, gndr, eml, number);

                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text('Record Added',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 24,
                                )),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok',
                                      style:
                                          TextStyle(color: Colors.deepPurple)))
                            ],
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
