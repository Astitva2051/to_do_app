import 'package:flutter/cupertino.dart';

class Taskcmplt extends ChangeNotifier {
  List<String> taskdonelist = List.empty(growable: true);

  addtask(String task) {
    taskdonelist.add(task);
    notifyListeners();
  }
}
