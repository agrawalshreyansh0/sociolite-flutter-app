
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/models/user.dart';
import 'package:sociolite/providers/search_provider.dart';

class SearchUserList extends StatefulWidget {
  const SearchUserList({super.key});

  @override
  State<SearchUserList> createState() => _SearchUserListState();
}

class _SearchUserListState extends State<SearchUserList> {
  final scrolllistController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrolllistController.addListener(_scrolllistListner);
  }

  void _scrolllistListner() {
    if (scrolllistController.position.pixels ==
        scrolllistController.position.maxScrollExtent) {
      Provider.of<SearchProvider>(context, listen: false).fetchUsers('');
    } 
  }

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    List<User> users = searchProvider.getAllUsers();
    return ListView.builder(
      controller: scrolllistController,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          User user = users[index];
          return ChangeNotifierProvider.value(
            value: user,
            child: Container(
              height: 300,
              margin: const EdgeInsets.symmetric(vertical: 7),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(user.name),
            ),
          );
        });
  }
}
