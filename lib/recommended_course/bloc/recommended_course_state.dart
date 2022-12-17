part of 'recommended_course_bloc.dart';

enum RecommendedCourseStatus { initial, loading, success, failure }

class RecommendedCourseState extends Equatable {
  final RecommendedCourseStatus status;
  final List<Course> courses;
  final bool hasReachedMax;
  final int offset;
  final CourseType courseType;
  final String? errorMessage;

  const RecommendedCourseState({
    this.status = RecommendedCourseStatus.initial,
    this.courses = const <Course>[],
    this.hasReachedMax = false,
    this.offset = 0,
    this.courseType = CourseType.recommended,
    this.errorMessage,
  });

  @override
  List<Object> get props =>
      [status, courses, hasReachedMax, offset, courseType];

  RecommendedCourseState copyWith({
    RecommendedCourseStatus? status,
    List<Course>? courses,
    bool? hasReachedMax,
    int? offset,
    CourseType? courseType,
    String? errorMessage,
  }) {
    return RecommendedCourseState(
      status: status ?? this.status,
      courses: courses ?? this.courses,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      offset: offset ?? this.offset,
      courseType: courseType ?? this.courseType,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
