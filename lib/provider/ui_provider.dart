import 'package:flutter/cupertino.dart';

class UiProvider extends ChangeNotifier{
   bool _isDark = false;
  bool get isDark => _isDark;
  changeTheme(){
    _isDark =!_isDark;
    notifyListeners();
  }
}