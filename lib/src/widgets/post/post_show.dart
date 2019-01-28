import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../services/main.dart';
import '../../interface/posts.dart';

import '../comment/comments.dart';
import '../comment/comment_new.dart';

class PostShow extends StatefulWidget {
  final Post post;
  final MainModel model;
  PostShow(this.post, this.model);

  @override
  State<StatefulWidget> createState() {
    return _PostShowState();
  }
}

class _PostShowState extends State<PostShow> {
  @override
  void initState() {
//    widget.model.toggleLoadingStatue(true);
    widget.model.postComments(widget.post.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Viewing Post #${widget.post.id}'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Container(
          padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _postTitle(),
              SizedBox(height: 20.0),
              _postBody(),
              SizedBox(height: 20.0),
              _postComments(),
              SizedBox(height: 20.0),
              Divider(),
              _addComment(widget.post),
            ],
          ),
        ),
      ),
    );
  }

  Widget _postTitle() {
    return Container(
      // color: Colors.green,
      child: Text(
        widget.post.title.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _postBody() {
    return Container(
//      color: Colors.indigo,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        widget.post.body,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _postComments() {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return model.commentLoading
          ? Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 20.0),
                  Text(
                    'Loading comments...',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            )
          : Expanded(child: Comments());
    });
  }

  Widget _addComment(post) {
    return RaisedButton(
      child: Text(
        'Add Comment',
        style: TextStyle(color: Colors.white),
      ),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CommentNew(post);
            });
      },
    );
  }
}
