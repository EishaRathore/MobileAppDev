import '../theme/theme.dart';
import 'package:path/path.dart';
import '../components/userData.dart';
import '../components/navDrawer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import '../components/expenseView.dart';
import '../components/revenueView.dart';
import '../database/databaseSchema.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String amount = '';
  List expensesList = [];
  List revenuesList = [];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userData = ModalRoute.of(context)!.settings.arguments as UserData;
    void getDataFromDB() async {
      var path = join((await getDatabasesPath()), 'expenses.db');
      Database db = await initializeDB(path);
      var userAmount = await db.query(
        UserTable.tableName,
        columns: [UserTable.columnAmount],
        where: '${UserTable.columnEmail} = ?',
        whereArgs: [userData.email],
      );

      List expenses = await db.query(
        ExpenseTable.tableName,
        columns: [
          'rowid',
          ExpenseTable.columnTitle,
          ExpenseTable.columnAmount,
          ExpenseTable.columnTimestamp,
        ],
        where: '${UserTable.columnEmail} = ?',
        whereArgs: [userData.email],
        orderBy: '${ExpenseTable.columnTimestamp} desc',
      );

      List revenues = await db.query(
        RevenueTable.tableName,
        columns: [
          'rowid',
          RevenueTable.columnTitle,
          RevenueTable.columnAmount,
          RevenueTable.columnTimestamp,
        ],
        where: '${UserTable.columnEmail} = ?',
        whereArgs: [userData.email],
        orderBy: '${ExpenseTable.columnTimestamp} desc',
      );

      setState(
        () {
          amount = userAmount[0]['amount'].toString();
          expensesList = expenses;
          revenuesList = revenues;
        },
      );
    }

    if (amount.length == 0) getDataFromDB();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: amount.length > 0
                  ? Text(
                      '\$$amount',
                      style: TextStyle(
                        fontSize: 25,
                        color: double.parse(amount) < 0
                            ? Colors.redAccent[700]
                            : backgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : CircularProgressIndicator(color: backgroundColor),
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: 'Expenses'),
            Tab(text: 'Revenue'),
          ],
        ),
      ),
      drawer: Drawer(
        child: NavDrawer(userData: userData),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ExpenseView(
            expensesList: expensesList,
            email: userData.email,
            userAmount: amount,
            getDataFromDB: getDataFromDB,
          ),
          RevenueView(
            revenuesList: revenuesList,
            email: userData.email,
            userAmount: amount,
            getDataFromDB: getDataFromDB,
          ),
        ],
      ),
    );
  }
}
