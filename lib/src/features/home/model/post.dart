// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Post {
  final int? id;
  final String title;
  final String body;
  final int? userId;
  final List<dynamic> tags;
  final int reactions;
  Post({
    this.id,
    required this.title,
    required this.body,
    this.userId,
    required this.tags,
    required this.reactions,
  });

  Post copyWith({
    int? id,
    String? title,
    String? body,
    int? userId,
    List<dynamic>? tags,
    int? reactions,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      userId: userId ?? this.userId,
      tags: tags ?? this.tags,
      reactions: reactions ?? this.reactions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'userId': userId,
      'tags': tags,
      'reactions': reactions,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      body: map['body'] as String,
      userId: map['userId'] != null ? map['userId'] as int : null,
      tags: List<dynamic>.from((map['tags'] as List<dynamic>)),
      reactions: map['reactions'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, title: $title, body: $body, userId: $userId, tags: $tags, reactions: $reactions)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.body == body &&
        other.userId == userId &&
        listEquals(other.tags, tags) &&
        other.reactions == reactions;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        body.hashCode ^
        userId.hashCode ^
        tags.hashCode ^
        reactions.hashCode;
  }
}
