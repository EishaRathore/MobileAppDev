import 'package:flutter/material.dart';

import '../constants.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
   required Key key,
   required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var key2 = null;
        return TextFieldContainer(
          key: key2,
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
