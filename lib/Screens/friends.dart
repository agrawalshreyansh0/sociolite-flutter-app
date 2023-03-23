import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';

import '../providers/main_user_provider.dart';
import '../utils/themes.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    var friends = Provider.of<UserProvider>(context).user.friends;
    return Layout1(
        header: "Friends",
        child: ListView.builder(
            itemCount: friends!.length,
            itemBuilder: ((context, index) {
              var friend = friends[index];
              return ChangeNotifierProvider.value(
                value: friend,
                child: GestureDetector(
                  onTap: (() => Navigator.pushNamed(
                      context, MyRoutes.anotherUserProfile,
                      arguments: friend.id)),
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                        color: MyTheme.containerColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(friend.avatar.toString()),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                              children: [
                                TextSpan(
                                  text: "${friend.name}\n",
                                  style: TextStyle(
                                    color: MyTheme.text1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                TextSpan(
                                  text: "${friend.email}",
                                  style: TextStyle(
                                    color: MyTheme.text2,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        // const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: MyTheme.containerColorSecondary,
                              borderRadius: BorderRadius.circular(10)),
                          height: 30,
                          width: 70,
                          child: const Center(
                              child: Text(
                            "Remove",
                          )),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}
