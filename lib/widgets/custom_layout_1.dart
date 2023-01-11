// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sociolite/utils/themes.dart';

class Layout1 extends StatelessWidget {
  final String header;
  final Widget child;
  const Layout1({
    super.key,
    required this.header,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      backgroundColor: MyTheme.primary,
      appBar: AppBar(centerTitle: true,
        title: Text(
          header,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: MyTheme.containerColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),
          ),
        ),
        child: child,
      ),
    ));
  }
}
