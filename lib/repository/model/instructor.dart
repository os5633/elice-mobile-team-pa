import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'instructor.g.dart';

@JsonSerializable()
class Instructor extends Equatable {
  final int id;
  @JsonKey(name: "fullname")
  final String fullName;

  const Instructor({
    required this.id,
    required this.fullName,
  });

  @override
  List<Object> get props => [id, fullName];

  factory Instructor.fromJson(Map<String, dynamic> json) =>
      _$InstructorFromJson(json);
}
