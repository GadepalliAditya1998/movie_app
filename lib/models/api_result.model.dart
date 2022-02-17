import 'package:json_annotation/json_annotation.dart';
part 'api_result.model.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class ApiResult<T> {
  late int count;
  late T data;

  ApiResult();
  factory ApiResult.fromJson(Map<String, dynamic> map, T Function(dynamic) callback) {
    if (map['data'] is List) {
      map['data'] = List.from(map['data']).map((e) => e as Map<String, dynamic>).toList();
    }

    return _$ApiResultFromJson(map, callback);
  }
}
