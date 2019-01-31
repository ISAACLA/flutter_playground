import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../services/main.dart';

class AlbumsPage extends StatelessWidget {
  final MainModel model;
  AlbumsPage(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums')
      ),
      body: Stack(
        children: <Widget>[
          Text('1'),
          SizedBox(height: 10.0,),
          Text('2')
        ],
      ),
    );
  }
}


