import 'package:flutter/material.dart';

final drawerpanel = DrawerHeader(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      UserAccountsDrawerHeader(
        accountEmail:
            Text("eisha@gmail.com", style: TextStyle(color: Colors.white)),
        accountName: Text("Eisha Nawaz",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurple[200],
        ),
      ),
    ],
  ),
);
