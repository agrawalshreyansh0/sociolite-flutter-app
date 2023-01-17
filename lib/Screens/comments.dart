import 'package:flutter/material.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout1(
      header: "Comments",child: Container(color: Colors.red),
    ); 
  }
}
