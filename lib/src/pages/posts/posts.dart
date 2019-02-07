import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../services/main.dart';
// import '../../interface/path.dart';

import '../../widgets/post/posts_list.dart';
import '../../widgets/ui/drawer.dart';

class PostsPage extends StatefulWidget {
  final MainModel model;
  PostsPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<PostsPage> {
  // PathMode _pathMode = PathMode.Posts;

  @override
  void initState() {
    widget.model.posts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // drawer: _drawer(),
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('ALL POSTS'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainModel model) {
      if (model.postLoading) {
        Widget content = Container(
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Loading'),
                ],
              ),
            ),
          ),
        );
        return content;
      } else {
        Widget content = Center(
          child: PostsList(),
        );
        return content;
      }
    });
  }
}
