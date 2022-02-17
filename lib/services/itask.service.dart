import 'package:movie_app/models/task-item.model.dart';

abstract class ITaskService {
  Future<List<TaskItem>> getTasksList();
}
