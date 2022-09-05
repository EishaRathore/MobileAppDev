import '../theme/theme.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/roundButton.dart';
import '../database/databaseSchema.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddExpenseTab extends StatefulWidget {
  const AddExpenseTab({
    Key? key,
    required this.email,
    required this.getAmountCallback,
  }) : super(key: key);

  final String email;
  final Function getAmountCallback;

  @override
  _AddExpenseTabState createState() => _AddExpenseTabState();
}

class _AddExpenseTabState extends State<AddExpenseTab> {
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  String title = '';
  String amount = '0';

  @override
  Widget build(BuildContext context) {
    final email = widget.email;

    void addExpense() async {
      try {
        var path = join((await getDatabasesPath()), 'expenses.db');

        Database db = await initializeDB(path);

        await db.transaction(
          (txn) async {
            var id = await txn.insert(
              ExpenseTable.tableName,
              {
                ExpenseTable.columnUserEmail: email,
                ExpenseTable.columnTitle: title,
                ExpenseTable.columnAmount: int.parse(amount),
                ExpenseTable.columnTimestamp:
                    DateTime.now().millisecondsSinceEpoch
              },
            );

            print(id.toString());

            var userAmount = await txn.query(
              UserTable.tableName,
              columns: [UserTable.columnAmount],
              where: '${UserTable.columnEmail} = ?',
              whereArgs: [email],
            );

            double totalAmount =
                double.parse(userAmount[0]['amount'].toString());
            double remainder = totalAmount - double.parse(amount);

            print(remainder.toString());

            await txn.update(
              UserTable.tableName,
              {UserTable.columnAmount: remainder},
              where: '${UserTable.columnEmail} = ?',
              whereArgs: [email],
            );
          },
        );

        widget.getAmountCallback();

        setState(() => showSpinner = false);
        FocusScope.of(context).unfocus();

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Expense Transaction added successfully.'),
          ),
        );
        db.close();
      } catch (e) {
        setState(() => showSpinner = false);

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Could Not Complete the Transaction.',
              style: kErrorStyle,
            ),
          ),
        );
        print(e);
      }
    }

    return Form(
      key: _formKey,
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 48,
                ),
                Text(
                  'Add Expenses',
                  textAlign: TextAlign.center,
                  style: kTabViewHeadingStyle,
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                  decoration: kTextFieldDecoration.copyWith(
                    prefixIcon: Icon(Icons.title),
                    labelText: 'Transaction Title',
                    hintText: 'Enter Transaction Title',
                  ),
                  keyboardType: TextInputType.name,
                  onChanged: (value) => title = value,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please Enter a Transaction Title';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: kTextFieldDecoration.copyWith(
                    prefixIcon: Icon(Icons.attach_money),
                    labelText: 'Amount',
                    hintText: 'Enter an Amount',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => amount = value,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please Enter an Amount';
                    else if (!RegExp(r'^[0-9]+$').hasMatch(value.toString()))
                      return 'Please Enter a valid Amount.';

                    return null;
                  },
                ),
                SizedBox(height: 20),
                RoundButton(
                  color: primaryColor,
                  title: 'Add Expense',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() => showSpinner = true);
                      addExpense();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
