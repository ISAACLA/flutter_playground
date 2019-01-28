import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../services/main.dart';

import 'comment_card.dart';

class Comments extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemCount: model.displayComments.length,
          itemBuilder: (BuildContext context, int index) {
            return CommentCard(model.displayComments[index]);
          }
        );
      },
    );
  }
}