import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/models/main_user.dart';
import 'package:sociolite/providers/main_user_provider.dart';
import 'package:sociolite/utils/themes.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';

class FriendRequests extends StatelessWidget {
  const FriendRequests({super.key});

  @override
  Widget build(BuildContext context) {
    var requests = Provider.of<UserProvider>(context).user.requestsRecieved;
    return Layout1(
      header: "FriendRequests",
      child: ListView.builder(
        itemCount: requests!.length,
        itemBuilder: (context, index) {
          var user = requests[index];
          return Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar.toString()),
                ),
                SizedBox(
                  width: 20,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "${user.name}\n",
                          style: TextStyle(color: MyTheme.text1)),
                      TextSpan(
                          text: "${user.email}",
                          style: TextStyle(color: MyTheme.text2, fontSize: 12))
                    ],
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: MyTheme.primary,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check,
                        color: MyTheme.icon1,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.clear,
                        color: MyTheme.icon1,
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
