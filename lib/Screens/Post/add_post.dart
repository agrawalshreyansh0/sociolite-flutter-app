import 'dart:developer';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/models/main_user.dart';
import 'package:sociolite/providers/main_user_provider.dart';
import 'package:sociolite/providers/post_provider.dart';
import 'package:sociolite/utils/global_variables.dart';
import 'package:sociolite/utils/routes.dart';
import 'package:sociolite/utils/themes.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

TextEditingController _contentController = TextEditingController();
File image = File('');
bool imageloaded = false;

class _AddPostState extends State<AddPost> {
  createPost(BuildContext context, String userId) async {
    if (!imageloaded || _contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Add and image and write the content")));
      return;
    }
    Navigator.pushNamed(context, MyRoutes.homeRoute);
    String imageUrl = await addImageToCloudinary();
    Provider.of<PostsProvider>(context, listen: false)
        .addPost(userId.toString(), _contentController.text, imageUrl);
    imageloaded = false;
    _contentController.text = "";
  }

  addImageToCloudinary() async {
    try {
      final cloudinary = CloudinaryPublic(
          Globals.cloudinaryCloudName, Globals.cloudinaryPostsImagePreset);
      CloudinaryResponse res =
          await cloudinary.uploadFile(CloudinaryFile.fromFile(image.path));
      return res.secureUrl;
    } catch (err) {
      log(err.toString());
    }
  }

  addImage() async {
    try {
      var getImage = await FilePicker.platform.pickFiles(type: FileType.image);
      if (getImage != null) {
        image = File(getImage.files.single.path.toString());
        imageloaded = true;
        setState(() {});
      }
    } catch (err) {
      log(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    MainUser user = Provider.of<UserProvider>(context, listen: false).user;
    return Layout1(
        header: 'Create New Post',
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: MyTheme.containerColor,
                  borderRadius: BorderRadius.circular(30)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: MyTheme.primary),
                        ),
                        GestureDetector(
                          onTap: () => createPost(context, user.id),
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                                color: MyTheme.primary,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Post",
                              style: TextStyle(color: MyTheme.text3),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    imageloaded
                        ? GestureDetector(
                            onTap: () => addImage(),
                            child: Image.file(
                              image,
                              fit: BoxFit.cover,
                              height: 300,
                            ),
                          )
                        : DottedBorder(
                            borderType: BorderType.Rect,
                            radius: const Radius.circular(10),
                            strokeCap: StrokeCap.round,
                            dashPattern: const [10, 4],
                            child: GestureDetector(
                              onTap: (() => addImage()),
                              child: Container(
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                width: double.infinity,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.add_a_photo_outlined),
                                      Text("Add Image"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 7,
                      maxLength: 200,
                      controller: _contentController,
                      decoration: InputDecoration(
                        hintText: "What's on your mind?",
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 0, color: Colors.grey.shade100),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 0, color: Colors.grey.shade100),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 0, color: Colors.grey.shade100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 0, color: Colors.grey.shade100),
                        ),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyTheme.primary),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
