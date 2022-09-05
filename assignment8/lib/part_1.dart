import 'package:flutter/material.dart';

// ignore: camel_case_types
class Part_1 extends StatefulWidget {
  Part_1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Part_1State createState() => _Part_1State();
}

// ignore: camel_case_types
class _Part_1State extends State<Part_1> {
  //drop down button variable
  String _chosenValue;
  //icon button variables
  bool _isBluetoothOn = false;

  //elevated action buttons
  bool pressEON = false;
  bool pressEOFF = false;
  String _value = ""; // popup menu variable
  //text Button actions variales
  bool pressTON = false;
  bool pressTOFF = false;

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.blue[800],
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
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  title: Text('Buttons Widget'),
                  backgroundColor: Colors.transparent,
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(child: Text('DropdownButton')),
                      Tab(child: Text('IconButton')),
                      Tab(child: Text('ElevatedButton')),
                      Tab(child: Text('PopupMenuButton')),
                      Tab(child: Text('TextButton')),
                    ],
                  ),
                ),
              ];
            },
            body: Container(
              decoration: new BoxDecoration(color: Colors.black),
              child: TabBarView(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: DropdownButton<String>(
                        focusColor: Colors.white,
                        value: _chosenValue,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.white,
                        items: <String>[
                          'item 1',
                          'item 2',
                          'item 3',
                          'item 4',
                          'item 5',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Please choose a Item",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _chosenValue = value;
                          });
                        },
                        dropdownColor: Colors.blue[800],
                      ),
                    ),
                  ),
                  Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.bluetooth),
                              color: _isBluetoothOn ? Colors.blue : Colors.grey,
                              iconSize: 48,
                              onPressed: () {
                                setState(() {
                                  _isBluetoothOn = !_isBluetoothOn;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Is Bluetooth On : $_isBluetoothOn',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: ElevatedButton(
                        child: pressEON ? Text("Pressed") : Text("Not Pressed"),
                        onPressed: () {
                          setState(() {
                            pressEON = !pressEON;
                            pressEOFF = !pressEOFF;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: pressEON ? Colors.blue : Colors.grey,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          PopupMenuButton(
                            icon: Icon(
                              Icons.list_alt_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            elevation: 20,
                            enabled: true,
                            onSelected: (value) {
                              setState(() {
                                _value = value;
                              });
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text("First Value"),
                                value: "first",
                              ),
                              PopupMenuItem(
                                child: Text("Second Value"),
                                value: "Second",
                              ),
                              PopupMenuItem(
                                child: Text("Third Value"),
                                value: "Third",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Selected Value : $_value',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: TextButton(
                        child: pressTON
                            ? Text(
                                "Pressed",
                                style: TextStyle(fontSize: 24),
                              )
                            : Text(
                                "Not Pressed",
                                style: TextStyle(fontSize: 24),
                              ),
                        style: TextButton.styleFrom(
                          primary: pressTON ? Colors.white : Colors.grey,
                          shape: const BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                          setState(() {
                            pressTON = !pressTON;
                            pressTOFF = !pressTOFF;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
