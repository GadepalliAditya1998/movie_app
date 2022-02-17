// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_result.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResult<T> _$ApiResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(dynamic json) fromJsonT,
) =>
    ApiResult<T>()
      ..count = json['count'] as int
      ..data = fromJsonT(json['data']);
