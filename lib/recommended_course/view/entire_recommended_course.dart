import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:elice_mobile_team_pa/free_course/free_course.dart';
import 'package:elice_mobile_team_pa/recommended_course/recommended_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntireRecommendedCourse extends StatefulWidget {
  const EntireRecommendedCourse({super.key});

  @override
  State<EntireRecommendedCourse> createState() =>
      _EntireRecommendedCourseState();
}

class _EntireRecommendedCourseState extends State<EntireRecommendedCourse> {
  final _scrollController = ScrollController();

  static const APP_BAR_TITLE = "추천 과목";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      appBar: const GlobalAppBar(
        color: AppColors.navy,
        title: Text(
          APP_BAR_TITLE,
          style: AppTextStyle.head2,
        ),
      ),
      body: BlocBuilder<EntireRecommendedCourseBloc,
          EntireRecommendedCourseState>(
        buildWhen: (previous, current) =>
            previous.status != current.status ||
            previous.courses != current.courses,
        builder: (context, state) {
          int ItemCount =
              state.hasReachedMax ? state.courseCount : state.courses.length;
          switch (state.status) {
            case EntireRecommendedCourseStatus.failure:
              return EmptyCourse(message: state.errorMessage);
            case EntireRecommendedCourseStatus.initial:
              return const Center(child: CircularProgressIndicator());
            default:
              return RefreshIndicator(
                onRefresh: () async => context
                    .read<EntireRecommendedCourseBloc>()
                    .add(RefreshRecommendedCourse()),
                child: ListView.separated(
                  controller: _scrollController,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  itemCount: ItemCount + 1,
                  itemBuilder: (context, index) {
                    if (index == ItemCount) {
                      return state.status != EntireFreeCourseStatus.loading
                          ? const SizedBox.shrink()
                          : const Center(child: CircularProgressIndicator());
                    }
                    return EntireCourseCard(course: state.courses[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 13),
                ),
              );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context
          .read<EntireRecommendedCourseBloc>()
          .add(RecommendedCourseFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
