part of 'free_course_bloc.dart';

enum FreeCourseStatus { initial, loading, success, failure }

class FreeCourseState extends Equatable {
  final FreeCourseStatus status;
  final List<Course> courses;
  final bool hasReachedMax;
  final int offset;
  final CourseType courseType;

  const FreeCourseState(
      {this.status = FreeCourseStatus.initial,
      this.courses = const <Course>[],
      this.hasReachedMax = false,
      this.offset = 0,
      this.courseType = CourseType.free});

  @override
  List<Object> get props =>
      [status, courses, hasReachedMax, offset, courseType];

  FreeCourseState copyWith({
    FreeCourseStatus? status,
    List<Course>? courses,
    bool? hasReachedMax,
    int? offset,
    CourseType? courseType,
  }) {
    return FreeCourseState(
      status: status ?? this.status,
      courses: courses ?? this.courses,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      offset: offset ?? this.offset,
      courseType: courseType ?? this.courseType,
    );
  }
}
