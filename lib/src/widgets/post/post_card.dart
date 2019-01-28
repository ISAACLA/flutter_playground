import 'package:flutter/material.dart';

import '../../interface/posts.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    final String postBody = post.body.substring(0, 60);

    return GestureDetector(
        child: Card(
          child: ListTile(
            // leading: Icon(
            //   Icons.number,
            //   color: Theme.of(context).primaryColor,
            // ),
            leading: Text(
              post.id.toString(),
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            title: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                post.title.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ),
            subtitle: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                postBody + ' ...',
                textAlign: TextAlign.justify,
              ),
            ),
            // trailing: Icon(Icons.info),
          ),
        ),
        onTap: () {
          Navigator.pushNamed<bool>(context, '/post/' + post.id.toString());
        });
  }
}
