import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../interface/posts.dart';
import '../../services/main.dart';

class CommentNew extends StatefulWidget {
//  final MainModel model;
  final Post post;
  CommentNew(this.post);

  @override
  State<StatefulWidget> createState() {
    return _CommentNewState();
  }
}

class _CommentNewState extends State<CommentNew> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = '';
  String name = '';
  String body = '';

  final Map<String, dynamic> _formData = {
    'email': 'isaac@email.com',
    'name': null,
    'body': null,
  };

//  @override
//  void initState() {
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0,),
          title: Container(
            child: Text(
              'Add Comment',
              textAlign: TextAlign.center,
            ),
          ),
          children: <Widget>[
            _commentName(),
            _commentBody(),
            SizedBox(height: 5.0),
            _actionButton(),
          ],
        ),
      ),
    );
  }

  Widget _commentName() {
    return Container(
      child: TextFormField(
        maxLines: 2,
        decoration: InputDecoration(
          labelText: 'Name',
        ),
        validator: (String value) {
          if (value.isEmpty || value.length < 3) {
            return 'Name should be at least 5 characters.';
          }
        },
        onSaved: (String value){
          this.name = value;
          _formData['name'] = value;
//          _formData['name'] = value;
//          setState(() {
//            name =  value;
//          });
        },
      ),
    );
  }

  Widget _commentBody() {
    return TextFormField(
      maxLines: 3,
      decoration: InputDecoration(
        labelText: 'Body',
      ),
      validator: (String value){
        if (value.isEmpty || value.length < 8) {
          return 'Comment body should be at least 8 characters';
        }
      },
      onSaved: (String value){
        _formData['body'] = value;
//        setState(() {
//          body = value;
//        });
      },
    );
  }

  Widget _actionButton() {
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model){
      return RaisedButton(
        child: Text(
          'Submit',
          style: TextStyle(color: Colors.white),
        ),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          if(!_formKey.currentState.validate()){
            return;
          }

          _formKey.currentState.save();

          Map<String, dynamic> newComment = {
            'postId': widget.post.id,
            'email': _formData['email'],
            'name': _formData['name'],
            'body': _formData['body'],
          };

          FocusScope.of(context).requestFocus(new FocusNode());
          Navigator.of(context).pop();

          model.newComment(newComment).then((_){
            print('done');
          }).catchError((err) {
            FocusScope.of(context).requestFocus(new FocusNode());
            Navigator.of(context).pop();
          });
        },
      );
    });
  }
}
