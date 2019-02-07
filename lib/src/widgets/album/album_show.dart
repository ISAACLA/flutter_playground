import 'package:flutter/material.dart';

import '../../interface/album.dart';

class AlbumShow extends StatefulWidget {
  final Album album;
  AlbumShow(this.album);

  @override
  State<StatefulWidget> createState() {
    return _albumShow();
  }
}

class _albumShow extends State<AlbumShow>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.album.title}'),
      ),
      body: Center(child: Text('Phots are here')),
    );
  }
}