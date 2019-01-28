import 'dart:async';
import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../interface/posts.dart';

mixin PostsModel on Model {
  bool _postLoading = false;
  String url = 'https://jsonplaceholder.typicode.com';
  List<Post> _posts = [];
//  Post _post;

  bool get postLoading {
    return _postLoading;
  }

//  Post get thePost{
//    return _post;
//  }

  List<Post> get allPosts {
    return List.from(_posts);
  }

//  void viewPost(Post post){
//    _post = post;
//  }

  Future<dynamic> posts() {
    _postLoading = true;
    notifyListeners();

    return http.get(url + '/posts').then((http.Response response) {
      List<Post> dataList = [];

      var responseData = json.decode(response.body);

      responseData.forEach((postData) {
        final Post post = Post(
          userId: postData['userId'],
          id: postData['id'],
          title: postData['title'],
          body: postData['body'],
        );

        dataList.insert(0, post);
      });

      _posts = dataList;

      _postLoading = false;
      notifyListeners();
    }).catchError((err) {
      _postLoading = false;
      notifyListeners();
    });
  }
}
