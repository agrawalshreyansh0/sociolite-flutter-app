// ignore_for_file: public_member_api_docs, sort_constructors_first

class Post {
  String userName;
  String title;
  String imageUrl;
  int likeCount;
  String userImageUrl; 
  String description;

  Post({
    required this.userName,
    required this.title,
    required this.imageUrl,
    required this.userImageUrl,
    required this.likeCount,
    required this.description,
  });
}
