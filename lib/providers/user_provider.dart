import 'package:flutter/material.dart';
import 'package:future_jobs/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel _userModel;

  UserModel get userModel => this._userModel;

  set userModel(UserModel value) {
    this._userModel = value;
    notifyListeners();
  }
}
