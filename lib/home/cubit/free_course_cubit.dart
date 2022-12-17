import 'package:bloc/bloc.dart';
import 'package:elice_mobile_team_pa/repository/model/models.dart';
import 'package:elice_mobile_team_pa/repository/repository.dart';
import 'package:elice_mobile_team_pa/support/support.dart';
import 'package:equatable/equatable.dart';

part 'free_course_state.dart';

class FreeCourseCubit extends Cubit<FreeCourseState> {
  FreeCourseCubit(this.courseRepository) : super(const FreeCourseState());

  final CourseRepository courseRepository;

  Future<void> onFreeCourseFetched() async {
    try {
      if (state.status == FreeCourseStatus.initial) {
        final courseRes = await courseRepository.fetchCourse(
          isFree: true,
          isRecommended: false,
          offset: 0,
          count: 10,
        );
        if (courseRes.result.status != "ok") {
          throw EliceException(courseRes.result.reason);
        }
        emit(
          state.copyWith(
            status: FreeCourseStatus.success,
            courses: courseRes.courses,
          ),
        );
      }
    } on EliceException catch (err) {
      emit(state.copyWith(
        status: FreeCourseStatus.failure,
        errorMessage: err.message,
      ));
    } catch (err) {
      emit(
        state.copyWith(
          status: FreeCourseStatus.failure,
          errorMessage: err.toString(),
        ),
      );
    }
  }
}
