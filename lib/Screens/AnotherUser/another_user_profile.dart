import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/models/main_user.dart';
import 'package:sociolite/providers/main_user_provider.dart';
import 'package:sociolite/services/friend_services.dart';
import '../../utils/global_variables.dart';
import '../../utils/themes.dart';
import '../../widgets/custom_layout_1.dart';

class AnotherUserProfile extends StatefulWidget {
  const AnotherUserProfile({super.key});

  @override
  State<AnotherUserProfile> createState() => _AnotherUserProfileState();
}

class _AnotherUserProfileState extends State<AnotherUserProfile> {
  bool fetch = false;
  MainUser user = MainUser(
      id: 'fdsadf', name: 'Shreyansh', email: 'ashreyansh47@gmail.com');

  fetchUserData(String userid) async {
    if (!fetch) {
      user = await FriendService.getUserFromId(userid);
      setState(() {
        fetch = true;
      });
    }
  }

  fetchUserId() {}

  @override
  Widget build(BuildContext context) {
    var userid = ModalRoute.of(context)!.settings.arguments;
    if (userid == Globals.userId) {
      fetch = true;   
      user = Provider.of<UserProvider>(context, listen: false).user;
    } else {
      fetchUserData(userid.toString());
    }
    return fetch
        ? Layout1(
            header: " ",
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(62),
                              border:
                                  Border.all(color: MyTheme.primary, width: 2)),
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
                        GestureDetector(
                          onTap: (() {
                            // Navigator.pushNamed(context, MyRoutes.friendRequests)
                          }),
                          child: SizedBox(
                            height: 60,
                            width: 80,
                            child: Column(
                              children: [
                                Text(
                                  user.requestsRecieved!.length.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                        ),
                        VerticalDivider(
                          color: MyTheme.grey,
                          thickness: 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, MyRoutes.friends);
                          },
                          child: SizedBox(
                            height: 60,
                            width: 80,
                            child: Column(
                              children: [
                                Text(
                                  user.friends!.length.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Friends",
                                  style: TextStyle(color: MyTheme.text2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: MyTheme.grey,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 60,
                          width: 80,
                          child: Column(
                            children: [
                              const Text(
                                "50",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
    ;
  }
}
