import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class Part_2 extends StatefulWidget {
  Part_2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Part_2State createState() => _Part_2State();
}

enum RadioB { item1, item2, item3 }

// ignore: camel_case_types
class _Part_2State extends State<Part_2> {
  //check box variable
  bool _checkbox = false;

  // radio variables
  RadioB _radioB = RadioB.item1;

  //slider variable
  int _value = 6;

  //switch
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  //date & time picker
  double _height;
  double _width;

  String _setTime, _setDate;

  String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1997),
        lastDate: DateTime(2031));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return MaterialApp(
      theme: ThemeData(
        radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.blue; // the color when checkbox is selected;
              }
              return Colors.white; //the color when checkbox is unselected;
            },
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
            (states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.blue; // the color when checkbox is selected;
              }
              return Colors.white; //the color when checkbox is unselected;
            },
          ),
        ),
      ),
      home: DefaultTabController(
        length: 6,
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
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverAppBar(
                    title: Text('Icon & Selection Widgets'),
                    backgroundColor: Colors.transparent,
                    pinned: true,
                    floating: true,
                    bottom: TabBar(
                      isScrollable: true,
                      tabs: [
                        Tab(child: Text('CheckBox')),
                        Tab(child: Text('Date & Time Pickers')),
                        Tab(child: Text('Radio')),
                        Tab(child: Text('Slider')),
                        Tab(child: Text('Switch')),
                        Tab(child: Text('TextField')),
                      ],
                    ),
                  ),
                ];
              },
              body: Container(
                width: _width,
                height: _height,
                decoration: new BoxDecoration(color: Colors.black),
                child: TabBarView(
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 100),
                            Checkbox(
                              value: _checkbox,
                              onChanged: (value) {
                                setState(() {
                                  _checkbox = !_checkbox;
                                });
                              },
                            ),
                            Text(
                              'Check Box',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'Choose Date',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5),
                              ),
                              InkWell(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: Container(
                                  width: _width / 1.7,
                                  height: _height / 9,
                                  margin: EdgeInsets.only(top: 15),
                                  alignment: Alignment.center,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[200]),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 30),
                                    textAlign: TextAlign.center,
                                    enabled: false,
                                    keyboardType: TextInputType.text,
                                    controller: _dateController,
                                    onSaved: (String val) {
                                      _setDate = val;
                                    },
                                    decoration: InputDecoration(
                                        disabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide.none),
                                        // labelText: 'Time',
                                        contentPadding:
                                            EdgeInsets.only(top: 0.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'Choose Time',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5),
                              ),
                              InkWell(
                                onTap: () {
                                  _selectTime(context);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: _width / 1.7,
                                  height: _height / 9,
                                  alignment: Alignment.center,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[200]),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 30),
                                    textAlign: TextAlign.center,
                                    onSaved: (String val) {
                                      _setTime = val;
                                    },
                                    enabled: false,
                                    keyboardType: TextInputType.text,
                                    controller: _timeController,
                                    decoration: InputDecoration(
                                        disabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide.none),
                                        // labelText: 'Time',
                                        contentPadding: EdgeInsets.all(5)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 150,
                            ),
                            ListTile(
                              title: const Text(
                                'Option 1',
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: Radio(
                                value: RadioB.item1,
                                groupValue: _radioB,
                                onChanged: (RadioB value) {
                                  setState(() {
                                    _radioB = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                'Option 2',
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: Radio(
                                value: RadioB.item2,
                                groupValue: _radioB,
                                onChanged: (RadioB value) {
                                  setState(() {
                                    _radioB = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                'Option 3',
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: Radio(
                                value: RadioB.item3,
                                groupValue: _radioB,
                                onChanged: (RadioB value) {
                                  setState(() {
                                    _radioB = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                            Icon(Icons.volume_up,
                                size: 40, color: Colors.white),
                            new Expanded(
                                child: Slider(
                                    value: _value.toDouble(),
                                    min: 1.0,
                                    max: 20.0,
                                    divisions: 10,
                                    activeColor: Colors.blue,
                                    inactiveColor: Colors.white,
                                    label: 'Set volume value',
                                    onChanged: (double newValue) {
                                      setState(() {
                                        _value = newValue.round();
                                      });
                                    },
                                    semanticFormatterCallback:
                                        (double newValue) {
                                      return '${newValue.round()} dollars';
                                    })),
                          ])),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                              scale: 2,
                              child: Switch(
                                onChanged: toggleSwitch,
                                value: isSwitched,
                                activeColor: Colors.blue,
                                activeTrackColor: Colors.white,
                                inactiveThumbColor: Colors.redAccent,
                                inactiveTrackColor: Colors.grey,
                              )),
                          Text('$textValue',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                      Icons.person_outline_outlined,
                                      color: Colors.white),
                                  hintText: 'Name',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                ),
                              ),
                            ),
                            RaisedButton(
                              textColor: Colors.white,
                              color: Colors.blue,
                              child: Text('Submit'),
                              onPressed: () {
                                return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title: Text('Submitted',
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
                                                  style: TextStyle(
                                                      color: Colors.blue)))
                                        ],
                                      );
                                    });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
