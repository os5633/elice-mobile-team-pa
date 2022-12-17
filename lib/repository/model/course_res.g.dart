// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseRes _$CourseResFromJson(Map<String, dynamic> json) => CourseRes(
      result: Result.fromJson(json['_result'] as Map<String, dynamic>),
      courses: (json['courses'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      courseCount: json['course_count'] as int,
    );

Map<String, dynamic> _$CourseResToJson(CourseRes instance) => <String, dynamic>{
      '_result': instance.result,
      'courses': instance.courses,
      'course_count': instance.courseCount,
    };
