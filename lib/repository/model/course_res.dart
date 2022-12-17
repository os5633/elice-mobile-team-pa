import 'package:elice_mobile_team_pa/repository/model/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course_res.g.dart';

@JsonSerializable()
class CourseRes extends Equatable {
  @JsonKey(name: "_result")
  final Result result;
  final List<Course> courses;
  @JsonKey(name: "course_count")
  final int courseCount;

  const CourseRes({
    required this.result,
    required this.courses,
    required this.courseCount,
  });

  @override
  List<Object> get props => [result, courses, courseCount];

  factory CourseRes.fromJson(Map<String, dynamic> json) =>
      _$CourseResFromJson(json);
}
