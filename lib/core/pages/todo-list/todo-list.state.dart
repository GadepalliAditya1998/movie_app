import 'package:flutter/cupertino.dart';
import 'package:movie_app/models/task-item.model.dart';
import 'package:movie_app/services/itask.service.dart';

import '../../injector/injector.dart';

/// This file holds all the logic of the UI.
///
/// - The UI will have only logic related to building the UI.
/// - This file is responsible for doing validation logic
/// - Implementing business logic required for this page (Like API calls, Form validations, any complex logic)
/// - Any exceptional handling can either be done here / thrown it to Global handler to handle.
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
