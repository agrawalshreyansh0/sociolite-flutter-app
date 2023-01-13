import 'package:flutter/material.dart';

import '../utils/themes.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              hintText: 'Search',
              prefixIcon: Icon(
                Icons.search,
                color: MyTheme.icon3,
                size: 25,
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey.shade300,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 0, color: Colors.grey.shade100),
              ),
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold, color: MyTheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
