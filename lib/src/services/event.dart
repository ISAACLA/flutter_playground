import 'dart:async';
import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../interface/event.dart';

mixin EventsModel on Model {
  bool _eventsLoading = false;

  String url = 'https://jsonplaceholder.typicode.com';
  List<Event> _events = [];

  List<Event> get allEvents {
    return _events;
  }

  Future<dynamic> events() {
    _eventsLoading = false;
    notifyListeners();

    // return
  }
}
