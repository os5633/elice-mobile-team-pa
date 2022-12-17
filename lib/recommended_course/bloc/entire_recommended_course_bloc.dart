import 'package:bloc/bloc.dart';
import 'package:elice_mobile_team_pa/repository/model/models.dart';
import 'package:elice_mobile_team_pa/repository/repository.dart';
import 'package:elice_mobile_team_pa/support/support.dart';
import 'package:equatable/equatable.dart';

part 'entire_recommended_course_event.dart';
part 'entire_recommended_course_state.dart';

const count = 10;
const isFree = false;
const isRecommended = true;

class EntireRecommendedCourseBloc
    extends Bloc<EntireRecommendedCourseEvent, EntireRecommendedCourseState> {
  EntireRecommendedCourseBloc(this.courseRepository)
      : super(const EntireRecommendedCourseState()) {
    on<RecommendedCourseFetched>(
      _onRecommendedCourseFetched,
      transformer: throttleDroppable(),
    );
    on<RefreshRecommendedCourse>(_refreshRecommendedCourse);
  }
  final CourseRepository courseRepository;

  void _refreshRecommendedCourse(
    RefreshRecommendedCourse event,
    Emitter<EntireRecommendedCourseState> emit,
  ) async {
    emit(
      state.copyWith(
        status: EntireRecommendedCourseStatus.initial,
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
          status: EntireRecommendedCourseStatus.success,
          courses: courseRes.courses,
          courseCount: courseRes.courseCount,
          hasReachedMax: courseRes.courseCount <= courseRes.courses.length,
          offset: state.offset + 1,
        ),
      );
    } on EliceException catch (err) {
      emit(state.copyWith(
        status: EntireRecommendedCourseStatus.failure,
        errorMessage: err.message,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: EntireRecommendedCourseStatus.failure,
          errorMessage: err.toString(),
        ),
      );
    }
  }

  Future<void> _onRecommendedCourseFetched(
    RecommendedCourseFetched event,
    Emitter<EntireRecommendedCourseState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == EntireRecommendedCourseStatus.initial) {
        final courseRes = await _fetchCourse();
        if (courseRes.result.status != "ok") {
          throw EliceException(courseRes.result.reason);
        }
        emit(
          state.copyWith(
            status: EntireRecommendedCourseStatus.success,
            courses: courseRes.courses,
            courseCount: courseRes.courseCount,
            hasReachedMax: courseRes.courseCount <= courseRes.courses.length,
            offset: state.offset + 1,
          ),
        );

        return;
      }
      emit(state.copyWith(status: EntireRecommendedCourseStatus.loading));
      final courseRes = await _fetchCourse();
      courseRes.courses.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: EntireRecommendedCourseStatus.success,
                courses: List.of(state.courses)..addAll(courseRes.courses),
                hasReachedMax: courseRes.courseCount <=
                    state.courses.length + courseRes.courses.length,
                offset: state.offset + 1,
              ),
            );
    } on EliceException catch (err) {
      emit(state.copyWith(
        errorMessage: err.message,
        status: EntireRecommendedCourseStatus.failure,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          errorMessage: err.toString(),
          status: EntireRecommendedCourseStatus.failure,
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
