import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../services/main.dart';

import '../../widgets/album/albums_list.dart';
import '../../widgets/ui/drawer.dart';

class AlbumsPage extends StatefulWidget {
  final MainModel model;
  AlbumsPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _albumsState();
  }
}

class _albumsState extends State<AlbumsPage> {
  @override
  void initState() {
    widget.model.albums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(title: Text('Albums')),
        body: _buildContent());
  }

  _buildContent() {
    return widget.model.albumLoading
        ? Container(
            child: Center(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Loading...')
                  ],
                ),
              ),
            ),
          )
        : AlbumsList();
  }
}
