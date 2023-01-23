import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/models/user.dart';
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
          User user = requests[index];
          return ChangeNotifierProvider.value(
            value: user,
            child: Container(
              decoration: BoxDecoration(
                  color: MyTheme.containerColor,
                  borderRadius: BorderRadius.circular(10)),
              height: 60,
              margin: const EdgeInsets.symmetric(vertical: 7),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar.toString()),
                  ),
                  // ignore: prefer_const_constructors
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
                            style:
                                TextStyle(color: MyTheme.text2, fontSize: 12))
                      ],
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: MyTheme.primary,
                    child: IconButton(
                        onPressed: () =>
                            Provider.of<UserProvider>(context, listen: false)
                                .acceptFriendRequest(user.id.toString()),
                        icon: Icon(
                          Icons.check,
                          color: MyTheme.icon1,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: IconButton(
                        onPressed: () =>
                            Provider.of<UserProvider>(context, listen: false)
                                .deleteFriendRequest(user.id.toString()),
                        icon: Icon(
                          Icons.clear,
                          color: MyTheme.icon1,
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
