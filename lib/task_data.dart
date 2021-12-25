import 'package:flutter/foundation.dart';
import 'Car_Item_list.dart';

class TaskData extends ChangeNotifier {
 CarItemList carItemList = Cevic;



  void changeCarItem(CarItemList catl) {
    carItemList=catl;
    notifyListeners();
  }

//  List<Task> _tasks = [
//    Task(name: 'Buy milk'),
//    Task(name: 'Buy eggs'),
//    Task(name: 'Buy bread'),
//  ];
//
//  UnmodifiableListView<Task> get tasks {
//    return UnmodifiableListView(_tasks);
//  }
//
//  int get taskCount {
//    return _tasks.length;
//  }
//
//  void addTask(String newTaskTitle) {
//    final task = Task(name: newTaskTitle);
//    _tasks.add(task);
//    notifyListeners();
//  }
//
//  void updateTask(Task task) {
//    task.toggleDone();
//    notifyListeners();
//  }
//
//  void deleteTask(Task task) {
//    _tasks.remove(task);
//    notifyListeners();
//  }
}
