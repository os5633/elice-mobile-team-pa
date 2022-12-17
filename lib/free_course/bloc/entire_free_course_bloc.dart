import 'package:bloc/bloc.dart';
import 'package:elice_mobile_team_pa/repository/model/models.dart';
import 'package:elice_mobile_team_pa/repository/repository.dart';
import 'package:elice_mobile_team_pa/support/support.dart';
import 'package:equatable/equatable.dart';

part 'entire_free_course_event.dart';
part 'entire_free_course_state.dart';

const count = 10;
const isFree = true;
const isRecommended = false;

class EntireFreeCourseBloc
    extends Bloc<EntireFreeCourseEvent, EntireFreeCourseState> {
  EntireFreeCourseBloc(this.courseRepository)
      : super(const EntireFreeCourseState()) {
    on<FreeCourseFetched>(
      _onFreeCourseFetched,
      transformer: throttleDroppable(),
    );
    on<RefreshFreeCourse>(_refreshFreeCourse);
  }

  final CourseRepository courseRepository;

  Future<void> _refreshFreeCourse(
    RefreshFreeCourse event,
    Emitter<EntireFreeCourseState> emit,
  ) async {
    emit(
      state.copyWith(
        status: EntireFreeCourseStatus.initial,
        hasReachedMax: false,
        courses: [],
        offset: 0,
      ),
    );
    try {
      final courseRes = await _fetchCourse();
      if (courseRes.result.status != "ok") {
        throw EliceException(courseRes.result.reason);
      }
      return emit(
        state.copyWith(
          status: EntireFreeCourseStatus.success,
          courses: courseRes.courses,
          courseCount: courseRes.courseCount,
          hasReachedMax: courseRes.courseCount <= courseRes.courses.length,
          offset: state.offset + 1,
        ),
      );
    } on EliceException catch (err) {
      emit(state.copyWith(
        status: EntireFreeCourseStatus.failure,
        errorMessage: err.message,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: EntireFreeCourseStatus.failure,
          errorMessage: err.toString(),
        ),
      );
    }
  }

  Future<void> _onFreeCourseFetched(
    FreeCourseFetched event,
    Emitter<EntireFreeCourseState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == EntireFreeCourseStatus.initial) {
        final courseRes = await _fetchCourse();
        if (courseRes.result.status != "ok") {
          throw EliceException(courseRes.result.reason);
        }
        emit(
          state.copyWith(
            status: EntireFreeCourseStatus.success,
            courses: courseRes.courses,
            courseCount: courseRes.courseCount,
            hasReachedMax: courseRes.courseCount <= courseRes.courses.length,
            offset: state.offset + 1,
          ),
        );
        return;
      }
      emit(state.copyWith(status: EntireFreeCourseStatus.loading));
      final courseRes = await _fetchCourse();
      emit(
        state.copyWith(
          status: EntireFreeCourseStatus.success,
          courses: List.of(state.courses)..addAll(courseRes.courses),
          hasReachedMax: courseRes.courseCount <=
              state.courses.length + courseRes.courses.length,
          offset: state.offset + 1,
        ),
      );
    } on EliceException catch (err) {
      emit(state.copyWith(
        status: EntireFreeCourseStatus.failure,
        errorMessage: err.message,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: EntireFreeCourseStatus.failure,
          errorMessage: err.toString(),
        ),
      );
    }
  }

  Future<CourseRes> _fetchCourse() async {
    final courseRes = await courseRepository.fetchCourse(
      isFree: isFree,
      isRecommended: isRecommended,
      offset: state.offset,
      count: count,
    );

    return courseRes;
  }
}
