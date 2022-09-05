import 'package:flutter/material.dart';

import '../constants.dart';
import 'text_field_container.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedTextField({
   required Key key,
   required this.hintText,
   required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        var key2 = null;
                return TextFieldContainer(
              key: key2,
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(

          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
