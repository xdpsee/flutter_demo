import 'dart:core';

import 'package:drip/model/post/post_content.dart';
import 'package:drip/model/user.dart';

class Post {

  int id;
  String title;
  User author;
  int date;
  PostContent content;

  Post.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.author = User.fromJson(json['author']);
    this.date = json['date'];
    this.content = PostContent.fromJson(json['content']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['id'] = this.id;
    json['title'] = this.title;
    json['author'] = this.author?.toJson();
    json['date'] = this.date;
    json['content'] = this.content?.toJson();
    return json;
  }

  @override
  String toString() => 'Post{id: $id}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Post &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;



}

