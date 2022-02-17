import 'package:flutter/cupertino.dart';
import 'package:movie_app/models/task-item.model.dart';
import 'package:movie_app/services/itask.service.dart';

import '../../injector/injector.dart';

class TodoListState with ChangeNotifier {
  List<TaskItem> taskItems = [];
  late ITaskService _taskService;

  bool isLoading = false;

  TodoListState() {
    this._taskService = Injector.get<ITaskService>();
    this.fetchTasks();
  }

  Future<void> fetchTasks() async {
    this.setLoading(true);
    this.taskItems = await this._taskService.getTasksList();
    this.setLoading(false);
  }

  void setLoading(bool status) {
    this.isLoading = status;
    notifyListeners();
  }
}
