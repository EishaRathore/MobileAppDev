import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewRecords extends StatelessWidget {
  Future fetchSubjects() async {
    var response = await http
        .get(Uri.parse("https://pcc.edu.pk/ws/list/vms_providers.php"));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        title: Text('View Records'),
        backgroundColor: Colors.transparent,
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
        child: FutureBuilder(
          future: fetchSubjects(),
          builder: (BuildContext _, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          showBottomBorder: true,
                          columnSpacing: 16,
                          columns: [
                            DataColumn(
                              label: Text(
                                'First Name',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DataColumn(
                                label: Text(
                              'Last Name',
                              style: TextStyle(color: Colors.white),
                            )),
                            DataColumn(
                                label: Text(
                              'Gender',
                              style: TextStyle(color: Colors.white),
                            )),
                            DataColumn(
                                label: Text(
                              'Phone',
                              style: TextStyle(color: Colors.white),
                            )),
                            DataColumn(
                                label: Text(
                              'Email',
                              style: TextStyle(color: Colors.white),
                            )),
                          ],
                          rows: snapshot.data
                              .map<DataRow>(
                                (record) => DataRow(cells: [
                                  DataCell(Text(
                                    record['firstName'] ?? '___',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  DataCell(Text(
                                    record['lastName'] ?? '___',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  DataCell(Text(
                                    record['gender'] ?? '___',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  DataCell(Text(
                                    record['phone'] ?? '___',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                  DataCell(Text(
                                    record['email'] ?? '___',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ]),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
