// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobsResponse _$JobsResponseFromJson(Map<String, dynamic> json) {
  return _JobsResponse.fromJson(json);
}

/// @nodoc
mixin _$JobsResponse {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get country => throw _privateConstructorUsedError;
  int get category => throw _privateConstructorUsedError;
  String get jobDescription => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobsResponseCopyWith<JobsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobsResponseCopyWith<$Res> {
  factory $JobsResponseCopyWith(
          JobsResponse value, $Res Function(JobsResponse) then) =
      _$JobsResponseCopyWithImpl<$Res, JobsResponse>;
  @useResult
  $Res call(
      {String id,
      String name,
      int country,
      int category,
      String jobDescription,
      String createdDate});
}

/// @nodoc
class _$JobsResponseCopyWithImpl<$Res, $Val extends JobsResponse>
    implements $JobsResponseCopyWith<$Res> {
  _$JobsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? country = null,
    Object? category = null,
    Object? jobDescription = null,
    Object? createdDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      jobDescription: null == jobDescription
          ? _value.jobDescription
          : jobDescription // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JobsResponseCopyWith<$Res>
    implements $JobsResponseCopyWith<$Res> {
  factory _$$_JobsResponseCopyWith(
          _$_JobsResponse value, $Res Function(_$_JobsResponse) then) =
      __$$_JobsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int country,
      int category,
      String jobDescription,
      String createdDate});
}

/// @nodoc
class __$$_JobsResponseCopyWithImpl<$Res>
    extends _$JobsResponseCopyWithImpl<$Res, _$_JobsResponse>
    implements _$$_JobsResponseCopyWith<$Res> {
  __$$_JobsResponseCopyWithImpl(
      _$_JobsResponse _value, $Res Function(_$_JobsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? country = null,
    Object? category = null,
    Object? jobDescription = null,
    Object? createdDate = null,
  }) {
    return _then(_$_JobsResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      jobDescription: null == jobDescription
          ? _value.jobDescription
          : jobDescription // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JobsResponse implements _JobsResponse {
  const _$_JobsResponse(
      {required this.id,
      required this.name,
      required this.country,
      required this.category,
      required this.jobDescription,
      required this.createdDate});

  factory _$_JobsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_JobsResponseFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int country;
  @override
  final int category;
  @override
  final String jobDescription;
  @override
  final String createdDate;

  @override
  String toString() {
    return 'JobsResponse(id: $id, name: $name, country: $country, category: $category, jobDescription: $jobDescription, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobsResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.jobDescription, jobDescription) ||
                other.jobDescription == jobDescription) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, country, category, jobDescription, createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobsResponseCopyWith<_$_JobsResponse> get copyWith =>
      __$$_JobsResponseCopyWithImpl<_$_JobsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobsResponseToJson(
      this,
    );
  }
}

abstract class _JobsResponse implements JobsResponse {
  const factory _JobsResponse(
      {required final String id,
      required final String name,
      required final int country,
      required final int category,
      required final String jobDescription,
      required final String createdDate}) = _$_JobsResponse;

  factory _JobsResponse.fromJson(Map<String, dynamic> json) =
      _$_JobsResponse.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get country;
  @override
  int get category;
  @override
  String get jobDescription;
  @override
  String get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$_JobsResponseCopyWith<_$_JobsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

ManyJobs _$ManyJobsFromJson(Map<String, dynamic> json) {
  return _ManyJobs.fromJson(json);
}

/// @nodoc
mixin _$ManyJobs {
  String get message => throw _privateConstructorUsedError;
  List<JobsResponse> get jobs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManyJobsCopyWith<ManyJobs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManyJobsCopyWith<$Res> {
  factory $ManyJobsCopyWith(ManyJobs value, $Res Function(ManyJobs) then) =
      _$ManyJobsCopyWithImpl<$Res, ManyJobs>;
  @useResult
  $Res call({String message, List<JobsResponse> jobs});
}

/// @nodoc
class _$ManyJobsCopyWithImpl<$Res, $Val extends ManyJobs>
    implements $ManyJobsCopyWith<$Res> {
  _$ManyJobsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? jobs = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      jobs: null == jobs
          ? _value.jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<JobsResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ManyJobsCopyWith<$Res> implements $ManyJobsCopyWith<$Res> {
  factory _$$_ManyJobsCopyWith(
          _$_ManyJobs value, $Res Function(_$_ManyJobs) then) =
      __$$_ManyJobsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<JobsResponse> jobs});
}

/// @nodoc
class __$$_ManyJobsCopyWithImpl<$Res>
    extends _$ManyJobsCopyWithImpl<$Res, _$_ManyJobs>
    implements _$$_ManyJobsCopyWith<$Res> {
  __$$_ManyJobsCopyWithImpl(
      _$_ManyJobs _value, $Res Function(_$_ManyJobs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? jobs = null,
  }) {
    return _then(_$_ManyJobs(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      jobs: null == jobs
          ? _value._jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<JobsResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ManyJobs implements _ManyJobs {
  const _$_ManyJobs(
      {required this.message, required final List<JobsResponse> jobs})
      : _jobs = jobs;

  factory _$_ManyJobs.fromJson(Map<String, dynamic> json) =>
      _$$_ManyJobsFromJson(json);

  @override
  final String message;
  final List<JobsResponse> _jobs;
  @override
  List<JobsResponse> get jobs {
    if (_jobs is EqualUnmodifiableListView) return _jobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jobs);
  }

  @override
  String toString() {
    return 'ManyJobs(message: $message, jobs: $jobs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManyJobs &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._jobs, _jobs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_jobs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ManyJobsCopyWith<_$_ManyJobs> get copyWith =>
      __$$_ManyJobsCopyWithImpl<_$_ManyJobs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ManyJobsToJson(
      this,
    );
  }
}

abstract class _ManyJobs implements ManyJobs {
  const factory _ManyJobs(
      {required final String message,
      required final List<JobsResponse> jobs}) = _$_ManyJobs;

  factory _ManyJobs.fromJson(Map<String, dynamic> json) = _$_ManyJobs.fromJson;

  @override
  String get message;
  @override
  List<JobsResponse> get jobs;
  @override
  @JsonKey(ignore: true)
  _$$_ManyJobsCopyWith<_$_ManyJobs> get copyWith =>
      throw _privateConstructorUsedError;
}
