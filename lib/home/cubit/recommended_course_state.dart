part of 'recommended_course_cubit.dart';

enum RecommendedCourseStatus { initial, success, failure }

class RecommendedCourseState extends Equatable {
  final RecommendedCourseStatus status;
  final List<Course> courses;
  final CourseType courseType;
  final String? errorMessage;

  const RecommendedCourseState({
    this.status = RecommendedCourseStatus.initial,
    this.courses = const <Course>[],
    this.courseType = CourseType.recommended,
    this.errorMessage,
  });

  @override
  List<Object> get props => [status, courses, courseType];

  RecommendedCourseState copyWith({
    RecommendedCourseStatus? status,
    List<Course>? courses,
    CourseType? courseType,
    String? errorMessage,
  }) {
    return RecommendedCourseState(
      status: status ?? this.status,
      courses: courses ?? this.courses,
      courseType: courseType ?? this.courseType,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
