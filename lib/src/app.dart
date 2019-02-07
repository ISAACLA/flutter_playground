import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'pages/auth/login.dart';
import 'pages/posts/posts.dart';
import 'pages/tasks/tasks.dart';
import 'pages/album/albums.dart';

import 'widgets/post/post_show.dart';
import 'widgets/album/album_show.dart';

import 'services/main.dart';

import 'interface/posts.dart';
import 'interface/album.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final MainModel _model = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.teal,
            accentColor: Colors.tealAccent,
          ),
          title: 'My App',
          routes: {
            '/': (BuildContext context) => Login(),
            'home': (BuildContext context) => PostsPage(_model),
            'events': (BuildContext context) => TasksPage(_model),
            'albums': (BuildContext context) => AlbumsPage(_model)
          },
          onGenerateRoute: (RouteSettings settings) {
            final List<String> pathElements = settings.name.split('/');
            if (pathElements[0] != '') {
              return null;
            }
            if (pathElements[1] == 'post') {
              final id = int.parse(pathElements[2]);
              final Post post =
                  _model.allPosts.firstWhere((Post post) => post.id == id);
              return MaterialPageRoute<bool>(
                  builder: (BuildContext context) => PostShow(post, _model));
            }

            else if(pathElements[1] == 'album'){
              final id = int.parse(pathElements[2]);
              final Album album = _model.allAlbums.firstWhere((Album album) => album.id == id);
              return MaterialPageRoute<bool>(
                builder: (BuildContext context) => AlbumShow(album)
              );
            }
            return null;
          }),
    );

    // return MaterialApp(
  }
}
