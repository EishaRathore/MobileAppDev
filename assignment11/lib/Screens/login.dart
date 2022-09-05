import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';
import 'package:path/path.dart';
import '../components/userData.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import '../components/roundButton.dart';
import '../database/databaseSchema.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    void login() async {
      try {
        var path = join((await getDatabasesPath()), 'expenses.db');
        Database db = await initializeDB(path);
        var name = await db.query(
          UserTable.tableName,
          columns: [UserTable.columnName],
          where:
              '${UserTable.columnEmail} = ? AND ${UserTable.columnPassword} = ?',
          whereArgs: [email, password],
        );
        db.close();

        print(name);

        if (name.length < 1)
          throw Exception();
        else {
          setState(
            () {
              showSpinner = false;
              FocusScope.of(context).unfocus();

              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (_) => false,
                arguments: UserData(
                  email: email,
                  name: name[0][UserTable.columnName].toString(),
                ),
              );
            },
          );
        }
      } catch (e) {
        setState(() => showSpinner = false);
        FocusScope.of(context).unfocus();

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Email and Password do not match.',
              style: kErrorStyle,
            ),
            duration: Duration(seconds: 3),
          ),
        );
        print(e);
      }
    }
   Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.pop(context);
          },
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               SizedBox(height: 48.0),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
                SizedBox(height: 48.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: kTextFieldDecoration.copyWith(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email Address',
                    hintText: 'Enter your email address',
                  ),
                  onChanged: (value) => email = value,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please Enter Email Address';
                    else if (!RegExp(
                            r'^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$')
                        .hasMatch(value.toString()))
                      return 'Please Enter a valid Email Address.';

                    return null;
                  },
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  obscureText: true,
                  decoration: kTextFieldDecoration.copyWith(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  onChanged: (value) => password = value,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please Enter Password';
                    else if (value.toString().length < 8)
                      return 'Password length must be greater than 8.';
                  },
                ),
                SizedBox(height: 24.0),
                Hero(
                  tag: 'login',
                  child: RoundButton(
                    color: Colors.lightGreen.shade900,
                    title: 'LOGIN',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => showSpinner = true);
                        login();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
