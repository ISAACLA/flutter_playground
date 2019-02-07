import 'dart:async';
import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../interface/task.dart';

mixin TasksModel on Model {
  bool _eventLoading = false;
  String url = 'https://jsonplaceholder.typicode.com';
  List<Task> _events = [];

  List<Task> get allEvents {
    return _events;
  }

  bool get eventLoading {
    return _eventLoading;
  }

  Future<dynamic> events() {
    _eventLoading = true;
    notifyListeners();

    return http.get(url + '/todos').then((http.Response response) {
      List<Task> eventDataList = [];

      var responseData = json.decode(response.body);

      responseData.forEach((eventData) {
        final Task event = Task(
          userId: eventData['userId'],
          id: eventData['id'],
          title: eventData['title'],
          completed: eventData['completed'],
        );
        eventDataList.insert(0, event);
      });

      _events = eventDataList;

      _eventLoading = false;
      notifyListeners();
    }).catchError((err) {
      _eventLoading = false;
      notifyListeners();
    });
  }
}
