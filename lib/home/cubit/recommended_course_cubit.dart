import 'package:bloc/bloc.dart';
import 'package:elice_mobile_team_pa/repository/model/models.dart';
import 'package:elice_mobile_team_pa/repository/repository.dart';
import 'package:elice_mobile_team_pa/support/support.dart';
import 'package:equatable/equatable.dart';

part 'recommended_course_state.dart';

class RecommendedCourseCubit extends Cubit<RecommendedCourseState> {
  RecommendedCourseCubit(this.courseRepository)
      : super(const RecommendedCourseState());

  final CourseRepository courseRepository;

  Future<void> onRecommendedCourseFetched() async {
    try {
      if (state.status == RecommendedCourseStatus.initial) {
        final courseRes = await courseRepository.fetchCourse(
          isFree: false,
          isRecommended: true,
          offset: 0,
          count: 10,
        );
        if (courseRes.result.status != "ok") {
          throw EliceException(courseRes.result.reason);
        }
        emit(
          state.copyWith(
            status: RecommendedCourseStatus.success,
            courses: courseRes.courses,
          ),
        );
      }
    } on EliceException catch (err) {
      emit(state.copyWith(
        status: RecommendedCourseStatus.failure,
        errorMessage: err.message,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: RecommendedCourseStatus.failure,
          errorMessage: err.toString(),
        ),
      );
    }
  }
}
