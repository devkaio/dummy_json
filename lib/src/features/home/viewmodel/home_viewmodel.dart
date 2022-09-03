import 'package:dummy_json/src/features/home/datasource/home_datasource.dart';
import 'package:dummy_json/src/features/home/state/home_state.dart';
import 'package:flutter/cupertino.dart';

import '../model/post.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeDatasource datasource;
  HomeState state = HomeStateEmpty();

  HomeViewModel(this.datasource);

  List<Post> _posts = [];

  void changeState(HomeState newState) {
    state = newState;
    notifyListeners();
  }

  List<Post> get posts => _posts;

  void getPosts() async {
    changeState(HomeStateLoading());

    _posts = await datasource.getPosts();

    if (_posts.isNotEmpty) {
      changeState(HomeStateSuccess());
    } else {
      changeState(HomeStateSuccess());
    }
  }
}
