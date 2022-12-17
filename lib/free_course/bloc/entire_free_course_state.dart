part of 'entire_free_course_bloc.dart';

enum EntireFreeCourseStatus { initial, loading, success, failure }

class EntireFreeCourseState extends Equatable {
  final EntireFreeCourseStatus status;
  final List<Course> courses;
  final int courseCount;
  final bool hasReachedMax;
  final int offset;
  final CourseType courseType;
  final String? errorMessage;

  const EntireFreeCourseState({
    this.status = EntireFreeCourseStatus.initial,
    this.courses = const <Course>[],
    this.courseCount = 0,
    this.hasReachedMax = false,
    this.offset = 0,
    this.courseType = CourseType.free,
    this.errorMessage,
  });

  @override
  List<Object> get props =>
      [status, courses, courseCount, hasReachedMax, offset, courseType];

  EntireFreeCourseState copyWith({
    EntireFreeCourseStatus? status,
    List<Course>? courses,
    int? courseCount,
    bool? hasReachedMax,
    int? offset,
    CourseType? courseType,
    String? errorMessage,
  }) {
    return EntireFreeCourseState(
      status: status ?? this.status,
      courses: courses ?? this.courses,
      courseCount: courseCount ?? this.courseCount,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      offset: offset ?? this.offset,
      courseType: courseType ?? this.courseType,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
