import 'package:flutter/material.dart';

class Event {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Event({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.completed,
  });
}
