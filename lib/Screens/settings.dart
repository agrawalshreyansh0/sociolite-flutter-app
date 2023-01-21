import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/utils/themes.dart';

import 'package:sociolite/widgets/custom_layout_1.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout1(
        header: "Settings",
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: MyTheme.icon3,
              ),
              title: const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(CupertinoIcons.right_chevron),
            ),
            ListTile(
              leading: Icon(
                Icons.language,
                color: MyTheme.icon3,
              ),
              title: const Text(
                "Language",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(CupertinoIcons.right_chevron),
            ),
            ListTile(
              leading: Icon(
                Icons.person_add_alt,
                color: MyTheme.icon3,
              ),
              title: const Text(
                "Friends",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(CupertinoIcons.right_chevron),
            ),
            ListTile(
              leading: Icon(
                Icons.notifications_off_outlined,
                color: MyTheme.icon3,
              ),
              title: const Text(
                "Notifications",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(CupertinoIcons.right_chevron),
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip_outlined,
                color: MyTheme.icon3,
              ),
              title: const Text(
                "Account and Privacy",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(CupertinoIcons.right_chevron),
            ),
            ListTile(
              leading: Icon(
                Icons.nightlight_outlined,
                color: MyTheme.icon3,
              ),
              title: const Text(
                "Theme",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(CupertinoIcons.right_chevron),
            ),
            ListTile(
              leading: Icon(
                Icons.help_outline_outlined,
                color: MyTheme.icon3,
              ),
              title: const Text(
                "Help",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(CupertinoIcons.right_chevron),
            ),
            ListTile(
              leading: Icon(
                Icons.error_outline_outlined,
                color: MyTheme.icon3,
              ),
              title: const Text(
                "About",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(CupertinoIcons.right_chevron),
            ),
            const Spacer(),
            GestureDetector(
              onTap:() =>  logout(context),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: MyTheme.primary,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: MyTheme.icon1,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Log out",
                      style: TextStyle(color: MyTheme.text3, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ));
  }

  logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, MyRoutes.logIn);
    clearCache();
  }

  clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
