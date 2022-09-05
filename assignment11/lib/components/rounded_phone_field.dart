import 'package:flutter/material.dart';

import '../constants.dart';
import 'text_field_container.dart';

class RoundedPhoneField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedPhoneField({
  required  Key key,
   required this.hintText,
 this.icon = Icons.phone,
  required  this.onChanged,required String labelText,required TextInputType keyboardType,
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
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
