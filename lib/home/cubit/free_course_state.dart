part of 'free_course_cubit.dart';

enum FreeCourseStatus { initial, success, failure }

class FreeCourseState extends Equatable {
  final FreeCourseStatus status;
  final List<Course> courses;
  final CourseType courseType;
  final String? errorMessage;

  const FreeCourseState({
    this.status = FreeCourseStatus.initial,
    this.courses = const <Course>[],
    this.courseType = CourseType.free,
    this.errorMessage,
  });

  @override
  List<Object> get props => [status, courses, courseType];

  FreeCourseState copyWith({
    FreeCourseStatus? status,
    List<Course>? courses,
    CourseType? courseType,
    String? errorMessage,
  }) {
    return FreeCourseState(
      status: status ?? this.status,
      courses: courses ?? this.courses,
      courseType: courseType ?? this.courseType,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
