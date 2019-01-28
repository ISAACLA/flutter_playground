import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../services/main.dart';
import '../../interface/event.dart';

import '../../widgets/ui/drawer.dart';

class EventsPage extends StatefulWidget {
  final MainModel model;
  EventsPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _EventsState();
  }
}

class _EventsState extends State<EventsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Events'),
        centerTitle: true,
      ),
    );
  }
}
