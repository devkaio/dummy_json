import 'package:dummy_json/src/exceptions/failure.dart';
import 'package:dummy_json/src/features/home/datasource/home_datasource.dart';
import 'package:dummy_json/src/features/home/state/home_state.dart';
import 'package:flutter/foundation.dart';


import '../model/post.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeDatasource datasource;
  HomeState state = HomeStateEmpty();

  HomeViewModel(this.datasource);

  List<Post> _posts = [];
  Failure? _errorMessage;

  void changeState(HomeState newState) {
    state = newState;
    notifyListeners();
  }

  List<Post> get posts => _posts;
  Failure? get errorMessage => _errorMessage;

  void getPosts() async {
    changeState(HomeStateLoading());

    try {
      _posts = await datasource.getPosts();

      changeState(HomeStateSuccess());
    } on Failure catch (e) {
      _errorMessage = e;
      changeState(HomeStateError());
    }
  }
}
