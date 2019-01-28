import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../services/main.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Menu'),
              ),
              ListTile(
//                selected: true,
                leading: Icon(Icons.textsms),
                title: Text('Posts'),
                onTap: () {
                  print('lets get some posts');
                  Navigator.pushReplacementNamed(context, 'home');
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              ListTile(
                leading: Icon(Icons.album),
                title: Text('Albums'),
                onTap: () {},
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              ListTile(
                leading: Icon(Icons.event),
                title: Text('Events'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'events');
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('Users'),
                onTap: () {},
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Controller'),
                onTap: () {},
              )
            ],
          ),
        );
      },
    );
  }
}
