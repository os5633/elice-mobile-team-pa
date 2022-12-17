part of 'entire_recommended_course_bloc.dart';

abstract class EntireRecommendedCourseEvent extends Equatable {
  const EntireRecommendedCourseEvent();

  @override
  List<Object> get props => [];
}

class RefreshRecommendedCourse extends EntireRecommendedCourseEvent {}

class RecommendedCourseFetched extends EntireRecommendedCourseEvent {}
