// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as int,
      title: json['title'] as String,
      logoFileUrl: json['logo_file_url'] as String?,
      instructors: (json['instructors'] as List<dynamic>)
          .map((e) => Instructor.fromJson(e as Map<String, dynamic>))
          .toList(),
      isDiscounted: json['is_discounted'] as bool,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'logo_file_url': instance.logoFileUrl,
      'instructors': instance.instructors,
      'is_discounted': instance.isDiscounted,
    };
