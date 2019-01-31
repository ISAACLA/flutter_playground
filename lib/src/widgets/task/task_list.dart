import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../services/main.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemCount: model.allEvents.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.lightBlue,
                  child: Text('${model.allEvents[index].title}')),
            );
          },
        );
      },
    );
  }
}
