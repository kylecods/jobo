import 'package:freezed_annotation/freezed_annotation.dart';

part 'jobs_model.freezed.dart';
part 'jobs_model.g.dart';

@freezed
class JobsResponse with _$JobsResponse {
  const factory JobsResponse({
    required String id,
    required String name,
    required int country,
    required int category,
    required String jobDescription,
    required String createdDate,
  }) = _JobsResponse;

  factory JobsResponse.fromJson(Map<String, dynamic> json) =>
      _$JobsResponseFromJson(json);
}

@freezed
class ManyJobs with _$ManyJobs {
  const factory ManyJobs({
    required String message,
    required List<JobsResponse> jobs,
  }) = _ManyJobs;

  factory ManyJobs.fromJson(Map<String, dynamic> json) =>
      _$ManyJobsFromJson(json);
}
