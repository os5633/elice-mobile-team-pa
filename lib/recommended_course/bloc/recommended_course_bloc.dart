import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:elice_mobile_team_pa/repository/model/models.dart';
import 'package:elice_mobile_team_pa/repository/repository.dart';
import 'package:elice_mobile_team_pa/support/support.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'recommended_course_event.dart';
part 'recommended_course_state.dart';

const count = 10;
const isFree = false;
const isRecommended = true;

EventTransformer<E> throttleDroppable<E>() {
  return (events, mapper) {
    return droppable<E>()
        .call(events.throttle(const Duration(milliseconds: 200)), mapper);
  };
}

class RecommendedCourseBloc
    extends Bloc<RecommendedCourseEvent, RecommendedCourseState> {
  RecommendedCourseBloc({required this.courseRepository})
      : super(const RecommendedCourseState()) {
    on<RecommendedCourseFetched>(
      _onPostFetched,
      transformer: throttleDroppable(),
    );
  }
  final CourseRepository courseRepository;

  Future<void> _onPostFetched(
    RecommendedCourseFetched event,
    Emitter<RecommendedCourseState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == RecommendedCourseStatus.initial) {
        final courseRes = await courseRepository.fetchCourse(
          isFree: isFree,
          isRecommended: isRecommended,
          offset: state.offset,
          count: count,
        );
        if (courseRes.result.status != "ok") {
          throw EliceException(courseRes.result.reason);
        }
        return emit(
          state.copyWith(
            status: RecommendedCourseStatus.success,
            courses: courseRes.courses,
            hasReachedMax: courseRes.courseCount == courseRes.courses.length,
          ),
        );
      }
      final courseRes = await courseRepository.fetchCourse(
        isFree: isFree,
        isRecommended: isRecommended,
        offset: state.offset,
        count: count,
      );
      courseRes.courses.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: RecommendedCourseStatus.success,
                courses: List.of(state.courses)..addAll(courseRes.courses),
                hasReachedMax: false,
              ),
            );
    } on EliceException catch (err) {
      emit(state.copyWith(
        errorMessage: err.message,
        status: RecommendedCourseStatus.failure,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          errorMessage: err.toString(),
          status: RecommendedCourseStatus.failure,
        ),
      );
    }
  }
}
