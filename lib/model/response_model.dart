// ignore_for_file: always_put_required_named_parameters_first, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    required String type,
    @JsonKey(name: 'context_id') required String contextId,
    String? data,
    @JsonKey(name: 'done') required bool isDone,
    @JsonKey(name: 'status_code') required int statusCode,
    @JsonKey(name: 'step_time') double? stepTime,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}
