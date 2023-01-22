import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';

class FriendRequests extends StatelessWidget {
  const FriendRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout1(header: "FriendRequests", child: SingleChildScrollView());
  }
}
