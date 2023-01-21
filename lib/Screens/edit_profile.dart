import 'dart:developer';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sociolite/providers/main_user_provider.dart';
import 'package:sociolite/providers/post_provider.dart';
import 'package:sociolite/utils/global_variables.dart';
import 'package:sociolite/widgets/custom_layout_1.dart';
import '../models/main_user.dart';
import '../utils/themes.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  File _image = File('');

  bool imageloaded = false;

  addImage() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        _image = File(result.files.single.path.toString());
      }
      imageloaded = true;
      setState(() {});
    } catch (error) {
      log(error.toString());
    }
  }

  updateUserProfile(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    if (!imageloaded) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Add User Profile")));
      return;
    }
    String imageUrl = await uploadImageToCloudinary();
    Provider.of<UserProvider>(context,listen: false).updateProfile(_nameController.text,_emailController.text,imageUrl.toString()); 
    imageloaded = false;
    Provider.of<PostsProvider>(context,listen: false).fetchPosts(); 
    Navigator.pop(context);
  }

  uploadImageToCloudinary() async {
    try {
      final cloudinary = CloudinaryPublic(
          Globals.cloudinaryCloudName, Globals.cloudinaryUsersAvatarsPreset);
      CloudinaryResponse response =
          await cloudinary.uploadFile(CloudinaryFile.fromFile(_image.path));
      return response.secureUrl;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    MainUser user = Provider.of<UserProvider>(context, listen: false).user;
    _nameController.text = user.name;
    _emailController.text = user.email;
    return Layout1(
      header: "Profile",
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
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Add Profile Picture",
                style: TextStyle(
                    color: MyTheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              imageloaded
                  ? GestureDetector(
                      onTap: () => addImage(),
                      child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(125),
                              border:
                                  Border.all(color: MyTheme.primary, width: 2)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(125),
                            child: Image.file(
                              _image,
                              fit: BoxFit.cover,
                              height: 250,
                              width: 250,
                            ),
                          )),
                    )
                  : DottedBorder(
                      borderType: BorderType.Circle,
                      radius: const Radius.circular(10),
                      strokeCap: StrokeCap.round,
                      dashPattern: const [10, 4],
                      child: GestureDetector(
                        onTap: () => addImage(),
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          width: 250,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name can not be empty";
                  }
                  return null;
                },
                cursorColor: Colors.black,
                controller: _nameController,
                style: const TextStyle(height: 1),
                decoration: InputDecoration(
                  hintText: "Enter new Name",
                  prefixIcon: Icon(
                    Icons.abc,
                    color: MyTheme.icon2,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: MyTheme.primary),
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
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email can not be empty";
                  }
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value.toString());
                  if (!emailValid) {
                    return "Invalid Email Format";
                  }
                  return null;
                },
                controller: _emailController,
                cursorColor: Colors.black,
                style: const TextStyle(height: 1),
                decoration: InputDecoration(
                  hintText: "Enter new Email address",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: MyTheme.icon2,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: MyTheme.primary),
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
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => updateUserProfile(context),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: MyTheme.primary,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: MyTheme.text3,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
