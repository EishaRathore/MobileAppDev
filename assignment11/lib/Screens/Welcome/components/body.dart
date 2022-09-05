import 'package:flutter/material.dart';
import 'package:flutter_sqlite/Screens/Welcome/components/background.dart';
import 'package:flutter_sqlite/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    var key2 = null;
        return Background(
          key: key2,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.pushNamed(context, '/login');
              },
              key: key2, onPressed: () {  },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              key: key2, onPressed: () {  }, press: () {Navigator.pushNamed(context, '/signup');  },
            ),
          ],
        ),
      ),
    );
  }
}
