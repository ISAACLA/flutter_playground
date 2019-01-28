import 'package:flutter/material.dart';

import '../../interface/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;

  CommentCard(this.comment);

  @override
  Widget build(BuildContext context) {
    final String body = comment.body.length > 60 ? comment.body.substring(0, 60) : comment.body;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Container(
              child: Text(
                comment.name,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15.0,
                  color: Theme.of(context).primaryColor
                ),
              ),
            ),
            subtitle: Container(
              child: Text(
                body,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              )
            ),
//            trailing: Icon(Icons.info, color: Theme.of(context).primaryColor,),
            onTap: (){
              print('${comment.id}');
            },
          ),

          Divider(height: 5.0, color: Theme.of(context).primaryColor,)
        ],
      ),
    );
  }
}

