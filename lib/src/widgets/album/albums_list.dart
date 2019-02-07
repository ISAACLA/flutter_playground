import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../services/main.dart';

import '../../interface/album.dart';

class AlbumsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return ListView.builder(
          itemCount: model.allAlbums.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.album),
                  title: Container(
                    child: Text('${model.allAlbums[index].title}'),
                  ),
                ),
                onTap: (){
                  Navigator.pushNamed<bool>(context, '/album/' + model.allAlbums[index].id.toString());
                },
              ),
            );
          });
    });
  }
}
