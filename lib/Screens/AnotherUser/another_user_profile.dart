import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/models/dummy_user.dart';
import 'package:sociolite/models/user.dart';
import 'package:sociolite/providers/main_user_provider.dart';
import 'package:sociolite/services/friend_services.dart';
import 'package:sociolite/utils/routes.dart';
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
  bool ismainuser = false;
  bool isfriend = false;
  bool isrequestSent = false;
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  var Mainuser;
  DummyUser user = DummyUser(
      id: 'fdsadf', name: 'Shreyansh', email: 'ashreyansh47@gmail.com');

  fetchUserData(String userid) async {
    if (!fetch) {
      user = await FriendService.getUserFromId(userid);
      setState(() {
        fetch = true;
      });
    }
  }

  _sendFriendRequest(String id) async {
    isrequestSent = true;
    setState(() {});
    user.requestsRecieved!.add(Globals.userId);
    await FriendService.sendRequest(id);
  }

  _unfriendUser(String id) async {
    isfriend = false;
    isrequestSent = false;
    Mainuser.friends!.remove(id);
    setState(() {});
    await FriendService.unfriend(id);
  }

  _deleteFriendRequest(String id) async {
    isrequestSent = false;
    user.requestsRecieved!.removeWhere((id) => id == Globals.userId);
    setState(() {});
    await FriendService.deleteRequest(id);
  }

  @override
  Widget build(BuildContext context) {
    var userid = ModalRoute.of(context)!.settings.arguments;
    // ignore: non_constant_identifier_names
    Mainuser = Provider.of<UserProvider>(context, listen: false).user;

    if (userid == Globals.userId) {
      fetch = true;
      ismainuser = true;
    } else {
      fetchUserData(userid.toString());
    }

    List<User>? friends = Mainuser.friends;

    if (!ismainuser) {
      for (int i = 0; i < friends!.length; i++) {
        var friend = friends[i];
        if (friend.id == user.id) {
          isfriend = true;
          break;
        }
      }
    }

    if (!isfriend) {
      for (int i = 0;
          i <
              (user.requestsRecieved == null
                  ? 0
                  : user.requestsRecieved!.length);
          i++) {
        if (user.requestsRecieved![i] == Globals.userId) {
          isrequestSent = true;
          break;
        }
      }
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
                              ismainuser
                                  ? Mainuser.avatar.toString()
                                  : user.avatar.toString(),
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
                            ismainuser ? Mainuser.name : user.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(ismainuser ? Mainuser.name : user.email),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ismainuser
                                  ?

                                  // it is main user
                                  GestureDetector(
                                      onTap: () => Navigator.pushNamed(
                                          context, MyRoutes.editProfile),
                                      child: Container(
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: MyTheme.primary,
                                            borderRadius:
                                                BorderRadius.circular(15)),
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
                                  : isfriend
                                      ?
                                      //it is a friend of the main user
                                      GestureDetector(
                                          onTap: () => _unfriendUser(user.id),
                                          child: Container(
                                            height: 30,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: MyTheme.primary,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                "Unfriend",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: MyTheme.text3,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      : isrequestSent
                                          ?
                                          // it is not a friend of the main user and request send
                                          GestureDetector(
                                              onTap: () =>
                                                  _deleteFriendRequest(user.id),
                                              child: Container(
                                                height: 30,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: MyTheme.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Center(
                                                  child: Text(
                                                    "Unsend",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: MyTheme.text3,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            )
                                          :

                                          // it is not a friend of the main user and request not send
                                          GestureDetector(
                                              onTap: () =>
                                                  _sendFriendRequest(user.id),
                                              child: Container(
                                                height: 30,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: MyTheme.primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Center(
                                                  child: Text(
                                                    "Add Friend",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: MyTheme.text3,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                              const SizedBox(width: 15),

                              // icon to reach to the chat page. 
                              ismainuser
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () =>Navigator.pushNamed(context, MyRoutes.chat, arguments: user),
                                      child: Container(
                                        height: 30,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: MyTheme.primary,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                          child: Icon(
                                            Icons.chat,
                                            color: MyTheme.icon1,
                                          ),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ],
                      ),
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
                                  ismainuser
                                      ? Mainuser.requestsRecieved == null
                                          ? "0"
                                          : Mainuser.requestsRecieved.length
                                              .toString()
                                      : user.requestsRecieved!.length
                                          .toString(),
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
                                  ismainuser
                                      ? Mainuser.friends == null
                                          ? "0"
                                          : Mainuser.friends.length.toString()
                                      : user.friends!.length.toString(),
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
  }
}
