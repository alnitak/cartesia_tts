// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) {
  return _ResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseModel {
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'context_id')
  String get contextId => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'done')
  bool get isDone => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_code')
  int get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'step_time')
  double? get stepTime => throw _privateConstructorUsedError;

  /// Serializes this ResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseModelCopyWith<ResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseModelCopyWith<$Res> {
  factory $ResponseModelCopyWith(
          ResponseModel value, $Res Function(ResponseModel) then) =
      _$ResponseModelCopyWithImpl<$Res, ResponseModel>;
  @useResult
  $Res call(
      {String type,
      @JsonKey(name: 'context_id') String contextId,
      String? data,
      @JsonKey(name: 'done') bool isDone,
      @JsonKey(name: 'status_code') int statusCode,
      @JsonKey(name: 'step_time') double? stepTime});
}

/// @nodoc
class _$ResponseModelCopyWithImpl<$Res, $Val extends ResponseModel>
    implements $ResponseModelCopyWith<$Res> {
  _$ResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? contextId = null,
    Object? data = freezed,
    Object? isDone = null,
    Object? statusCode = null,
    Object? stepTime = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      contextId: null == contextId
          ? _value.contextId
          : contextId // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      stepTime: freezed == stepTime
          ? _value.stepTime
          : stepTime // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseModelImplCopyWith<$Res>
    implements $ResponseModelCopyWith<$Res> {
  factory _$$ResponseModelImplCopyWith(
          _$ResponseModelImpl value, $Res Function(_$ResponseModelImpl) then) =
      __$$ResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      @JsonKey(name: 'context_id') String contextId,
      String? data,
      @JsonKey(name: 'done') bool isDone,
      @JsonKey(name: 'status_code') int statusCode,
      @JsonKey(name: 'step_time') double? stepTime});
}

/// @nodoc
class __$$ResponseModelImplCopyWithImpl<$Res>
    extends _$ResponseModelCopyWithImpl<$Res, _$ResponseModelImpl>
    implements _$$ResponseModelImplCopyWith<$Res> {
  __$$ResponseModelImplCopyWithImpl(
      _$ResponseModelImpl _value, $Res Function(_$ResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? contextId = null,
    Object? data = freezed,
    Object? isDone = null,
    Object? statusCode = null,
    Object? stepTime = freezed,
  }) {
    return _then(_$ResponseModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      contextId: null == contextId
          ? _value.contextId
          : contextId // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      stepTime: freezed == stepTime
          ? _value.stepTime
          : stepTime // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseModelImpl implements _ResponseModel {
  const _$ResponseModelImpl(
      {required this.type,
      @JsonKey(name: 'context_id') required this.contextId,
      this.data,
      @JsonKey(name: 'done') required this.isDone,
      @JsonKey(name: 'status_code') required this.statusCode,
      @JsonKey(name: 'step_time') this.stepTime});

  factory _$ResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseModelImplFromJson(json);

  @override
  final String type;
  @override
  @JsonKey(name: 'context_id')
  final String contextId;
  @override
  final String? data;
  @override
  @JsonKey(name: 'done')
  final bool isDone;
  @override
  @JsonKey(name: 'status_code')
  final int statusCode;
  @override
  @JsonKey(name: 'step_time')
  final double? stepTime;

  @override
  String toString() {
    return 'ResponseModel(type: $type, contextId: $contextId, data: $data, isDone: $isDone, statusCode: $statusCode, stepTime: $stepTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.contextId, contextId) ||
                other.contextId == contextId) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.stepTime, stepTime) ||
                other.stepTime == stepTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, contextId, data, isDone, statusCode, stepTime);

  /// Create a copy of ResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseModelImplCopyWith<_$ResponseModelImpl> get copyWith =>
      __$$ResponseModelImplCopyWithImpl<_$ResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseModel implements ResponseModel {
  const factory _ResponseModel(
          {required final String type,
          @JsonKey(name: 'context_id') required final String contextId,
          final String? data,
          @JsonKey(name: 'done') required final bool isDone,
          @JsonKey(name: 'status_code') required final int statusCode,
          @JsonKey(name: 'step_time') final double? stepTime}) =
      _$ResponseModelImpl;

  factory _ResponseModel.fromJson(Map<String, dynamic> json) =
      _$ResponseModelImpl.fromJson;

  @override
  String get type;
  @override
  @JsonKey(name: 'context_id')
  String get contextId;
  @override
  String? get data;
  @override
  @JsonKey(name: 'done')
  bool get isDone;
  @override
  @JsonKey(name: 'status_code')
  int get statusCode;
  @override
  @JsonKey(name: 'step_time')
  double? get stepTime;

  /// Create a copy of ResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseModelImplCopyWith<_$ResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
