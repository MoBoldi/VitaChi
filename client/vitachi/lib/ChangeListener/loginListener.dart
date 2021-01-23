import 'package:flutter/cupertino.dart';

class loginChangeListener extends ChangeNotifier{
  get isVisible => _isVisible;
  bool _isVisible = false;
  set isVisible(value){
    _isVisible = value;
    notifyListeners();
  }

}