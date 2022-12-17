import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:elice_mobile_team_pa/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContents extends StatelessWidget {
  const HomeContents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 22),
      children: [
        BlocBuilder<RecommendedCourseCubit, RecommendedCourseState>(
          buildWhen: (previous, current) =>
              previous.status != current.status ||
              previous.courses != current.courses,
          builder: (context, state) {
            switch (state.status) {
              case RecommendedCourseStatus.failure:
                return EmptyCourse(
                  message: state.errorMessage,
                );
              case RecommendedCourseStatus.success:
                return HorizontalCourses(
                  courses: state.courses,
                  courseType: state.courseType,
                );
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
        const SizedBox(height: 12),
        BlocBuilder<FreeCourseCubit, FreeCourseState>(
          buildWhen: (previous, current) =>
              previous.status != current.status ||
              previous.courses != current.courses,
          builder: (context, state) {
            switch (state.status) {
              case FreeCourseStatus.failure:
                return EmptyCourse(message: state.errorMessage);
              case FreeCourseStatus.success:
                return HorizontalCourses(
                  courses: state.courses,
                  courseType: state.courseType,
                );
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      ],
    );
  }
}
