part of 'entire_recommended_course_bloc.dart';

enum EntireRecommendedCourseStatus { initial, loading, success, failure }

class EntireRecommendedCourseState extends Equatable {
  final EntireRecommendedCourseStatus status;
  final List<Course> courses;
  final int courseCount;
  final bool hasReachedMax;
  final int offset;
  final CourseType courseType;
  final String? errorMessage;

  const EntireRecommendedCourseState({
    this.status = EntireRecommendedCourseStatus.initial,
    this.courses = const <Course>[],
    this.courseCount = 0,
    this.hasReachedMax = false,
    this.offset = 0,
    this.courseType = CourseType.recommended,
    this.errorMessage,
  });

  @override
  List<Object> get props =>
      [status, courses, courseCount, hasReachedMax, offset, courseType];

  EntireRecommendedCourseState copyWith({
    EntireRecommendedCourseStatus? status,
    List<Course>? courses,
    int? courseCount,
    bool? hasReachedMax,
    int? offset,
    CourseType? courseType,
    String? errorMessage,
  }) {
    return EntireRecommendedCourseState(
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
