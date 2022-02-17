// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task-item.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskItem _$TaskItemFromJson(Map<String, dynamic> json) => TaskItem()
  ..id = json['_id'] as String
  ..description = json['description'] as String
  ..owner = json['owner'] as String
  ..createdAt = DateTime.parse(json['createdAt'] as String)
  ..updatedAt = DateTime.parse(json['updatedAt'] as String)
  ..completed = json['completed'] as bool;

Map<String, dynamic> _$TaskItemToJson(TaskItem instance) => <String, dynamic>{
      '_id': instance.id,
      'description': instance.description,
      'owner': instance.owner,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'completed': instance.completed,
    };
