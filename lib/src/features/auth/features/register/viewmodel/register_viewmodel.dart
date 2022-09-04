import 'package:flutter/foundation.dart';

import '../../../../../exceptions/failure.dart';
import '../../model/user.dart';
import '../datasource/register_datasource.dart';
import '../state/register_state.dart';

class RegisterViewModel extends ChangeNotifier {
  final RegisterDatasource datasource;

  RegisterState state = RegisterStateEmpty();

  RegisterViewModel(this.datasource);

  User? _user;
  Failure? _errorMessage;

  void changeState(RegisterState newState) {
    state = newState;
    notifyListeners();
  }

  User? get userData => _user;
  Failure? get errorMessage => _errorMessage;

  void reset() {
    changeState(RegisterStateEmpty());
  }

  void register(
    String username,
    String password,
  ) async {
    changeState(RegisterStateLoading());
    try {
      _user = await datasource.register(
        username,
        password,
      );

      changeState(RegisterStateSuccess());
    } on Failure catch (e) {
      _errorMessage = e;
      changeState(RegisterStateError());
    }
  }
}
