import 'package:scoped_model/scoped_model.dart';

import 'post.dart';
import 'comment.dart';
import 'task.dart';
import 'album.dart';
// import 'ui-state.dart';

class MainModel extends Model with PostsModel, CommentsModel, TasksModel, AlbumsModel {}
