import 'package:elice_mobile_team_pa/repository/model/models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course extends Equatable {
  final int id;
  final String title;
  @JsonKey(name: "logo_file_url")
  final String? logoFileUrl;
  final List<Instructor> instructors;
  @JsonKey(name: "is_discounted")
  final bool isDiscounted;

  const Course({
    required this.id,
    required this.title,
    required this.logoFileUrl,
    required this.instructors,
    required this.isDiscounted,
  });

  @override
  List<Object> get props => [id, title, instructors, isDiscounted];

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

enum CourseType {
  recommended,
  free,
}
