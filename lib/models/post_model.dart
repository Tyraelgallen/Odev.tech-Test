import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.id,
    required this.name,
    required this.date,
    required this.text,
    required this.likes,
    required this.shares,
    required this.comments,
  });

  int? id;
  String name;
  String date;
  String text;
  int likes;
  int shares;
  int comments;
  // List<Comment> comments;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        name: json["name"],
        date: json["date"],
        text: json["text"],
        likes: json["likes"],
        shares: json["shares"],
        // comments: List<Comment>.from(
        //     json["comments"].map((x) => Comment.fromJson(x))),
        comments: json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date": date,
        "text": text,
        "likes": likes,
        "shares": shares,
        // "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "comments": comments,
      };
}

// class Comment {
//   Comment({
//     required this.id,
//     required this.name,
//     required this.date,
//     required this.text,
//     required this.likes,
//   });
//   int id;
//   String name;
//   String date;
//   String text;
//   String likes;

//   factory Comment.fromJson(Map<String, dynamic> json) => Comment(
//         id: json["id"],
//         name: json["name"],
//         date: json["date"],
//         text: json["text"],
//         likes: json["likes"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "date": date,
//         "text": text,
//         "likes": likes,
//       };
// }
