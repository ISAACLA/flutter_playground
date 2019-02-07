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
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: model.allEvents[index].completed,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (bool value){
                      print(model.allEvents[index].completed);
                    },
                  ),
                  Expanded(
                    child: Text(model.allEvents[index].title),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}


//Card(
//child: Container(
//padding: EdgeInsets.all(10.0),
//color: Colors.lightBlue,
//child: Text('${model.allEvents[index].title}')),
//);