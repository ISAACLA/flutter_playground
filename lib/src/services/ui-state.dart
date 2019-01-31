import 'package:scoped_model/scoped_model.dart';

import 'post.dart';
import 'task.dart';
import 'comment.dart';

mixin UiStateModel on Model {
  bool _loading = false;

  bool get isLoading {
    return _loading;
  }

  void loadingStatus(bool value) {
    _loading = value;
    notifyListeners();
  }
}
