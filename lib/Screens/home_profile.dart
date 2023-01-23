import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/models/main_user.dart';
import 'package:sociolite/providers/main_user_provider.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/utils/themes.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    MainUser user = Provider.of<UserProvider>(context, listen: false).user;
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: (() => Navigator.pushNamed(context, MyRoutes.settings)),
                child: const Icon(
                  Icons.settings,
                  size: 30,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(62),
                      border: Border.all(color: MyTheme.primary, width: 2)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(62),
                    child: Image.network(
                      user.avatar.toString(),
                      fit: BoxFit.cover,
                      height: 120,
                      width: 120,
                    ),
                  )),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(user.email),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, MyRoutes.editProfile),
                    child: Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          color: MyTheme.primary,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 15,
                              color: MyTheme.text3,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(onTap: (() => Navigator.pushNamed(context, MyRoutes.friendRequests)),
                  child: Column(
                    children: [
                       Text(
                        user.requestsRecieved!.length.toString(),
                        style:
                            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Requests",
                        style: TextStyle(color: MyTheme.text2),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  color: MyTheme.grey,
                  thickness: 1,
                ),
                Column(
                  children: [
                    const Text(
                      "50",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Posts",
                      style: TextStyle(color: MyTheme.text2),
                    ),
                  ],
                ),
                VerticalDivider(
                  color: MyTheme.grey,
                  thickness: 1,
                ),
                Column(
                  children: [
                    const Text(
                      "50",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Posts",
                      style: TextStyle(color: MyTheme.text2),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
