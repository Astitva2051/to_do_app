import 'package:flutter/cupertino.dart';

class ToDo extends ChangeNotifier {
  List<String> todolist = new List.empty(growable: true);
  Map<String, int> key = {};

  getkey(String item) {
    return key[item];
  }

  Additem(String item) {
    todolist.add(item);
    key[item] = todolist.length;
    notifyListeners();
  }

  Deleteitem(int index) {
    todolist.removeAt(index);
    notifyListeners();
  }
}
