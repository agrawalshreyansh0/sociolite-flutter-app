import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/providers/post_provider.dart';
import '../models/post.dart';
import '../utils/routes.dart';
import '../utils/themes.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    PostsProvider postsProvider = Provider.of<PostsProvider>(context);
    List<Post> posts = postsProvider.getPostList();
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        Post post = posts[posts.length - index - 1];
        return ChangeNotifierProvider.value(
            value: post,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyTheme.containerColor,
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        post.user.name.toString(),
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      width: double.infinity,
                      height: 400,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          post.imageUrl.toString(),
                          fit: BoxFit.cover,
                        ),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      post.content,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Consumer<Post>(
                        builder: (context, post, child) => IconButton(
                          onPressed: () => post.toggleLikeStatus(),
                          icon: Icon(post.like
                              ? Icons.favorite
                              : Icons.favorite_border),
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("Like"),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, MyRoutes.comments,
                              arguments: post.id)
                        },
                        child: Row(children: const [
                          Icon(CupertinoIcons.text_bubble),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Comment"),
                        ]),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Consumer<Post>(
                        builder: (context, value, child) => Text(
                          "Liked by ${post.likesCount}",
                          style: TextStyle(
                            color: MyTheme.text2,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
