import 'package:movie_app/core/network/http.service.dart';
import 'package:movie_app/models/api_result.model.dart';

import 'package:movie_app/models/task-item.model.dart';
import 'package:movie_app/services/itask.service.dart';

class TaskService implements ITaskService {
  HttpService httpService;

  TaskService({required this.httpService});

  @override
  Future<List<TaskItem>> getTasksList() async {
    var response = await this.httpService.get('/task');
    var apiResult = ApiResult.fromJson(response, (list) => TaskItem.fromJsonList(list));
    return apiResult.data;
  }
}
