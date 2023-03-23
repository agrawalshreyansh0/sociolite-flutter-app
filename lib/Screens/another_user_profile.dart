import 'package:flutter/material.dart';

import '../widgets/custom_layout_1.dart';


class AnotherUserProfile extends StatelessWidget {
  const AnotherUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var userid = ModalRoute.of(context)!.settings.arguments;
    return Layout1(
      header: " ",
      child: Column(),
    );
  }
}
