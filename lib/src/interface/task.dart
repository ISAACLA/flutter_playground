import 'package:flutter/material.dart';

class Task {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Task({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.completed,
  });
}
