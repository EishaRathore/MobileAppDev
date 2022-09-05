import 'dateTime.dart';
import '../theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import '../database/databaseSchema.dart';

class ExpenseView extends StatefulWidget {
  const ExpenseView(
      {Key? key,
      required this.expensesList,
      required this.email,
      required this.userAmount,
      required this.getDataFromDB})
      : super(key: key);
  final List expensesList;
  final String email;
  final String userAmount;
  final Function getDataFromDB;

  @override
  _ExpenseViewState createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  DateTime? startingDate;
  DateTime? endingDate;

  @override
  Widget build(BuildContext context) {
    List filteredList = new List.from(widget.expensesList);

    if (startingDate != null)
      filteredList = filteredList
          .where(
            (element) =>
                element[ExpenseTable.columnTimestamp] >=
                startingDate!.millisecondsSinceEpoch,
          )
          .toList();

    if (endingDate != null)
      filteredList = filteredList
          .where(
            (element) =>
                element[ExpenseTable.columnTimestamp] <=
                endingDate!.millisecondsSinceEpoch,
          )
          .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
      child: ListView(
        children: [
          Row(
            children: [
              OutlinedButton(
                child: Icon(Icons.date_range, color: Colors.white),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(5, 40)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();

                  showPickerDateRange(
                    context,
                    (date) => setState(() => startingDate = date),
                    (date) => setState(() => endingDate = date),
                    (error) {
                      if (error.isNotEmpty)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error, style: kErrorStyle),
                          ),
                        );
                    },
                  );
                },
              ),
              SizedBox(width: 20),
              startingDate != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From:',
                          style: TextStyle(color: primaryColor),
                        ),
                        Text(
                          DateFormat('dd-MM-yyyy').format(startingDate!),
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(width: 25),
              endingDate != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'To:',
                          style: TextStyle(color: primaryColor),
                        ),
                        Text(
                          DateFormat('dd-MM-yyyy').format(endingDate!),
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(width: 26),
              endingDate != null
                  ? TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.only(top: 14.0),
                        ),
                        shape: MaterialStateProperty.all(CircleBorder()),
                        minimumSize: MaterialStateProperty.all(Size(20, 20)),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                      onPressed: () => setState(
                        () => startingDate = endingDate = null,
                      ),
                    )
                  : Container(),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text('ID', style: kDataColumnTextStyle),
                ),
                DataColumn(
                  label: Text('TITLE', style: kDataColumnTextStyle),
                ),
                DataColumn(
                  numeric: true,
                  label: Text('AMOUNT', style: kDataColumnTextStyle),
                ),
                DataColumn(
                  numeric: true,
                  label: Text('TRANSACTION TIME', style: kDataColumnTextStyle),
                ),
                DataColumn(
                  label: Text('DELETE', style: kDataColumnTextStyle),
                ),
              ],
              rows: filteredList
                  .map(
                    (record) => DataRow(
                      cells: [
                        DataCell(
                          Text(record['rowid'].toString()),
                        ),
                        DataCell(
                          Text(record[ExpenseTable.columnTitle]),
                        ),
                        DataCell(
                          Text('\$ ' +
                              record[ExpenseTable.columnAmount].toString()),
                        ),
                        DataCell(
                          Text(
                            DateFormat('dd-MM-yyyy – kk:mm').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                record[ExpenseTable.columnTimestamp],
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              try {
                                var path = join(
                                  (await getDatabasesPath()),
                                  'expenses.db',
                                );

                                Database db = await initializeDB(path);

                                await db.transaction(
                                  (txn) async {
                                    await txn.delete(
                                      ExpenseTable.tableName,
                                      where: 'rowid = ?',
                                      whereArgs: [record['rowid']],
                                    );
                                    double remainder =
                                        double.parse(widget.userAmount) +
                                            double.parse(
                                              record[ExpenseTable.columnAmount]
                                                  .toString(),
                                            );

                                    print(remainder.toString());

                                    await txn.update(
                                      UserTable.tableName,
                                      {UserTable.columnAmount: remainder},
                                      where: '${UserTable.columnEmail} = ?',
                                      whereArgs: [widget.email],
                                    );
                                  },
                                );

                                await widget.getDataFromDB();

                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Expense Transaction deleted successfully.'),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Could Not Delete the Transaction.',
                                      style: kErrorStyle,
                                    ),
                                  ),
                                );

                                print(e);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
