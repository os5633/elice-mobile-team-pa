part of 'entire_free_course_bloc.dart';

abstract class EntireFreeCourseEvent extends Equatable {
  const EntireFreeCourseEvent();

  @override
  List<Object> get props => [];
}

class FreeCourseFetched extends EntireFreeCourseEvent {}

class RefreshFreeCourse extends EntireFreeCourseEvent {}
