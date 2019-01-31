import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../interface/comment.dart';
import '../../services/main.dart';

class CommentCard extends StatefulWidget {
  final Comment comment;
  final int currentIndex;
  CommentCard(this.comment, this.currentIndex);

  @override
  State<StatefulWidget> createState() {
    return _CommentCardState();
  }
}

class _CommentCardState extends State<CommentCard>{

  @override
  void initState() {
    print('comment, ${widget.comment.name}');
    print('curerntiNdeex, ${widget.currentIndex}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String body = widget.comment.body.length > 60 ? widget.comment.body.substring(0, 60) : widget.comment.body;

//    return Container(
//      padding: EdgeInsets.symmetric(horizontal: 5.0),
//      child: Column(
//        children: <Widget>[
//          ListTile(
//            title: Container(
//              child: Text(
//                comment.name,
//                style: TextStyle(
//                  fontStyle: FontStyle.italic,
//                  fontSize: 15.0,
//                  color: Theme.of(context).primaryColor
//                ),
//              ),
//            ),
//            subtitle: Container(
//              child: Text(
//                body,
//                textAlign: TextAlign.justify,
//                style: TextStyle(
//                  fontSize: 14.0,
//                ),
//              )
//            ),
////            trailing: Icon(Icons.info, color: Theme.of(context).primaryColor,),
//            onTap: (){
//              print('${comment.id}');
//            },
//          ),
//
//          Divider(height: 5.0, color: Theme.of(context).primaryColor,)
//        ],
//      ),
//    );

    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model){
        return Container(
          margin: EdgeInsets.all(10.0),
          child: ExpansionPanelList(
            children: <ExpansionPanel>[
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded){
                  isExpanded = widget.comment.isExpanded;
                  return Text('name ${widget.comment.name}');
                },
                body: Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(10.0),
                  child: Text('body $body'),
                ),
                isExpanded: widget.comment.isExpanded
              )
            ],
            expansionCallback: (int currentIndex, bool isExpanded){
              setState(() {
                print('here, $currentIndex');
                model.displayComments[currentIndex].isExpanded = !model.displayComments[currentIndex].isExpanded;
              });
            },
          )
        );
      },
    );
  }
}


//expansionCallback: (bool isExpanded) {
//setState(() {
//isExpanded = !isExpanded;
//});
//},