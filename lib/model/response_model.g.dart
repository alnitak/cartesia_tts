// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseModelImpl _$$ResponseModelImplFromJson(Map<String, dynamic> json) =>
    _$ResponseModelImpl(
      type: json['type'] as String,
      contextId: json['context_id'] as String,
      data: json['data'] as String?,
      isDone: json['done'] as bool,
      statusCode: (json['status_code'] as num).toInt(),
      stepTime: (json['step_time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ResponseModelImplToJson(_$ResponseModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'context_id': instance.contextId,
      'data': instance.data,
      'done': instance.isDone,
      'status_code': instance.statusCode,
      'step_time': instance.stepTime,
    };
