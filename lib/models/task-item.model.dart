import 'package:json_annotation/json_annotation.dart';
part 'task-item.model.g.dart';

@JsonSerializable()
class TaskItem {
  @JsonKey(name: '_id')
  late String id;
  late String description;
  late String owner;
  late DateTime createdAt;
  late DateTime updatedAt;
  late bool completed;

  TaskItem();

  factory TaskItem.fromMap(Map<String, dynamic> map) {
    return _$TaskItemFromJson(map);
  }

  Map<String, dynamic> toJson() => _$TaskItemToJson(this);

  static List<TaskItem> fromJsonList(List<Map<String, dynamic>> list) => list.map((e) => TaskItem.fromMap(e)).toList();
}
