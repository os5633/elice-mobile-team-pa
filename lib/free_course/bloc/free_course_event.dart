part of 'free_course_bloc.dart';

abstract class FreeCourseEvent extends Equatable {
  const FreeCourseEvent();

  @override
  List<Object> get props => [];
}

class FreeCourseFetched extends FreeCourseEvent {}
