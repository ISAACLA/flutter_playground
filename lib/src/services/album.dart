import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

import '../interface/album.dart';

mixin AlbumsModel on Model {
  String url = 'https://jsonplaceholder.typicode.com';
  bool _albumLoading = false;
  List<Album> _albums = [];

  bool get albumLoading {
    return _albumLoading;
  }

  List<Album> get allAlbums{
    return List.of(_albums);
  }

  Future<dynamic> albums() async {
    _albumLoading = true;
    notifyListeners();

    try{
      final http.Response response = await http.get(url + '/albums');

      if(response.statusCode != 200 && response.statusCode != 201){
        return false;
      }

      List<Album> albumsList = [];

      var responseData = json.decode(response.body);

      responseData.forEach((albumData){
        final Album album = Album(
          userId: albumData['userId'],
          id: albumData['id'],
          title: albumData['title']
        );

        albumsList.insert(0, album);
      });

      _albums = albumsList;

      _albumLoading = false;
      notifyListeners();

    }catch(error){
      _albumLoading = false;
      notifyListeners();
      print('$error');
    }
  }

  Future<dynamic> albumPhotos(){
    try{

    }catch (error){

    }
  }
}