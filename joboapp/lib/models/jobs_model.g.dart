// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobsResponse _$$_JobsResponseFromJson(Map<String, dynamic> json) =>
    _$_JobsResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      country: json['country'] as int,
      category: json['category'] as int,
      jobDescription: json['jobDescription'] as String,
      createdDate: json['createdDate'] as String,
    );

Map<String, dynamic> _$$_JobsResponseToJson(_$_JobsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'category': instance.category,
      'jobDescription': instance.jobDescription,
      'createdDate': instance.createdDate,
    };

_$_ManyJobs _$$_ManyJobsFromJson(Map<String, dynamic> json) => _$_ManyJobs(
      message: json['message'] as String,
      jobs: (json['jobs'] as List<dynamic>)
          .map((e) => JobsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ManyJobsToJson(_$_ManyJobs instance) =>
    <String, dynamic>{
      'message': instance.message,
      'jobs': instance.jobs,
    };
