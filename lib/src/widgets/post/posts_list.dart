import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../services/main.dart';

import 'post_card.dart';

class PostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemCount: model.allPosts.length,
          itemBuilder: (BuildContext context, int index) {
            return PostCard(model.allPosts[index]);
          },
        );
      },
    );
  }
}
