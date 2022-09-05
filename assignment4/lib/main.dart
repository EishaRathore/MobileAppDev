import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(title: 'Assignment 4'),
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.white,
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
  int _value = 1;
  int _value1 = 0;
  bool chk = false;
  bool chk1 = false;
  bool chk2 = false;
  List<bool> isSelected;
  List<bool> _isSelected;
  List<String> items = [
    'Sale',
    'Credit',
    'Refund',
    'Loan',
    'Diret Material',
    'Direct Labour',
    'Asset',
    'Other',
    'Overheade'
  ];
  List<String> isChecked = [];

  @override
  void initState() {
    isSelected = [false, false];
    _isSelected = [false, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Text(
              "Sort By",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            DropdownButton(
              value: _value,
              elevation: 100,
              style: TextStyle(color: Colors.black),
              focusColor: Colors.blueGrey,
              underline: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.0,
                      style: BorderStyle.solid,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              ),
              items: [
                DropdownMenuItem(
                  child: Text("Newest First"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Oldest First"),
                  value: 2,
                ),
                DropdownMenuItem(child: Text("Value High-Low"), value: 3),
                DropdownMenuItem(child: Text("Value Low-High"), value: 4)
              ],
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Transaction Types",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: ToggleButtons(
                hoverColor: Colors.pink[100],
                constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 3 - 2,
                ),
                borderColor: Colors.black,
                fillColor: Colors.pink,
                borderWidth: 2,
                selectedBorderColor: Colors.black,
                selectedColor: Colors.black,
                highlightColor: Colors.pink[100],
                borderRadius: BorderRadius.circular(10),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Money In',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Money Out',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                isSelected: isSelected,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            ...items
                .map(
                  (item) => CheckboxListTile(
                    title: Text(item),
                    checkColor: Colors.pink,
                    activeColor: Colors.grey,
                    value: isChecked.contains(item),
                    onChanged: (bool value) {
                      if (value) {
                        setState(() {
                          isChecked.add(item);
                        });
                      } else {
                        setState(() {
                          isChecked.remove(item);
                        });
                      }
                    },
                  ),
                )
                .toList(),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              thickness: 3,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "Transaction Health",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: ToggleButtons(
                hoverColor: Colors.pink[100],
                constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width / 6 - 3,
                ),
                borderColor: Colors.black,
                fillColor: Colors.pink,
                borderWidth: 2,
                highlightColor: Colors.pink[100],
                selectedBorderColor: Colors.black,
                selectedColor: Colors.black,
                borderRadius: BorderRadius.circular(10),
                children: <Widget>[
                  Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 20,
                        child: Icon(
                          Icons.thumb_up_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Good',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 20,
                        child: Icon(
                          Icons.thumb_down_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Ok',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20,
                        child: Icon(
                          Icons.thumb_down_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Bad',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _isSelected.length; i++) {
                      _isSelected[i] = i == index;
                    }
                  });
                },
                isSelected: _isSelected,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Divider(
              thickness: 3,
            ),
            SizedBox(
              height: 7.0,
            ),
            CheckboxListTile(
              title: const Text('Consultant Notes Only'),
              checkColor: Colors.pink,
              activeColor: Colors.grey,
              value: chk,
              onChanged: (bool value) {
                setState(() {
                  chk = value;
                });
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            Divider(
              thickness: 3,
            ),
            SizedBox(
              height: 5.0,
            ),
            CheckboxListTile(
              title: const Text('Overdue Only'),
              checkColor: Colors.pink,
              activeColor: Colors.grey,
              value: chk1,
              onChanged: (bool value) {
                setState(() {
                  chk1 = value;
                });
              },
            ),
            SizedBox(
              height: 5.0,
            ),
            Divider(
              thickness: 3,
            ),
            SizedBox(
              height: 5.0,
            ),
            CheckboxListTile(
              checkColor: Colors.pink,
              activeColor: Colors.grey,
              title: const Text('Date Range'),
              value: chk2,
              onChanged: (bool value) {
                setState(() {
                  chk2 = value;
                });
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Column(children: [
                  Text(
                    "From", // textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  DropdownButton(
                    value: _value1,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    focusColor: Colors.blueGrey,
                    underline: Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text("-"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Monday"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Tuesday"),
                        value: 2,
                      ),
                      DropdownMenuItem(child: Text("Wednesday"), value: 3),
                      DropdownMenuItem(child: Text("Thursday"), value: 4),
                      DropdownMenuItem(child: Text("Friday"), value: 5),
                      DropdownMenuItem(child: Text("Saturday"), value: 6),
                      DropdownMenuItem(child: Text("Sunday"), value: 7),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value1 = value;
                      });
                    },
                  ),
                ], crossAxisAlignment: CrossAxisAlignment.start),
                SizedBox(
                  width: 8.0,
                ),
                Column(
                  children: [
                    Text(
                      "To", // textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    DropdownButton(
                      value: _value,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      focusColor: Colors.blueGrey,
                      underline: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.0,
                              style: BorderStyle.solid,
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text("Monday"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Tuesday"),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text("Wednesday"), value: 3),
                        DropdownMenuItem(child: Text("Thursday"), value: 4),
                        DropdownMenuItem(child: Text("Friday"), value: 5),
                        DropdownMenuItem(child: Text("Saturday"), value: 6),
                        DropdownMenuItem(child: Text("Sunday"), value: 7),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
