part of 'recommended_course_bloc.dart';

abstract class RecommendedCourseEvent extends Equatable {
  const RecommendedCourseEvent();

  @override
  List<Object> get props => [];
}

class RecommendedCourseFetched extends RecommendedCourseEvent {}
