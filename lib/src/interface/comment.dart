import 'package:flutter/material.dart';

class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
  bool isExpanded;

  Comment({
    @required this.postId,
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.body,
    this.isExpanded = false
  });
}
