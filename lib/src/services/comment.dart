import 'dart:async';
import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../interface/comment.dart';

mixin CommentsModel on Model {
  String url = 'https://jsonplaceholder.typicode.com';
  List<Comment> _comments = [];
  bool _commentLoading;

  List<Comment> get showComments {
    return _comments;
  }

  bool get commentLoading {
    return _commentLoading;
  }

  List<Comment> get displayComments {
    return List.from(_comments);
  }

  Future<dynamic> postComments(int id) async {
    _commentLoading = true;

    try {
      final http.Response response =
          await http.get(url + '/comments?postId=' + id.toString());

      if(response.statusCode != 200 && response.statusCode != 201) {
        return false;
      }

      List<Comment> commentsList = [];

      var responseData = json.decode(response.body);

      responseData.forEach((commentData) {
        final Comment comment = Comment(
          postId: commentData['postId'],
          id: commentData['id'],
          name: commentData['name'],
          email: commentData['email'],
          body: commentData['body'],
        );
        commentsList.insert(0, comment);
        // commentsList.add(comment);
      });

      _comments = commentsList;

      _commentLoading = false;
      notifyListeners();
    } catch (error) {
      print('$error');
    }
  }

  Future<dynamic> newComment(comment) async {
    _commentLoading = true;

    try {
      final http.Response response =
          await http.post(url + '/comments', body: json.encode(comment));
      var responseData = json.decode(response.body);

      final Comment newComment = Comment(
        postId: comment['postId'],
        id: responseData['id'],
        name: comment['name'],
        email: comment['email'],
        body: comment['body'],
      );

      _commentLoading = false;
      notifyListeners();

      _comments.insert(0, newComment);
      notifyListeners();
    } catch (error) {
      _commentLoading = false;
      print('$error');
    }
  }
}
