import 'package:scoped_model/scoped_model.dart';

import 'post.dart';
import 'comment.dart';
import 'event.dart';
// import 'ui-state.dart';

class MainModel extends Model with PostsModel, CommentsModel, EventsModel {}
