import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:elice_mobile_team_pa/free_course/free_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntireFreeCourse extends StatefulWidget {
  const EntireFreeCourse({super.key});

  @override
  State<EntireFreeCourse> createState() => _EntireFreeCourseState();
}

class _EntireFreeCourseState extends State<EntireFreeCourse> {
  final _scrollController = ScrollController();

  static const APP_BAR_TITLE = "무료 과목";

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
          style: AppTextStyle.Head2,
        ),
      ),
      body: BlocBuilder<EntireFreeCourseBloc, EntireFreeCourseState>(
        buildWhen: (previous, current) =>
            previous.status != current.status ||
            previous.courses != current.courses,
        builder: (context, state) {
          switch (state.status) {
            case EntireFreeCourseStatus.failure:
              return EmptyCourse(message: state.errorMessage);
            case EntireFreeCourseStatus.initial:
              return const Center(child: CircularProgressIndicator());
            default:
              return RefreshIndicator(
                onRefresh: () async => context
                    .read<EntireFreeCourseBloc>()
                    .add(RefreshFreeCourse()),
                child: ListView.separated(
                  controller: _scrollController,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  itemCount: (state.hasReachedMax
                          ? state.courseCount
                          : state.courses.length) +
                      1,
                  itemBuilder: (context, index) {
                    if (index ==
                        (state.hasReachedMax
                            ? state.courseCount
                            : state.courses.length)) {
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
      context.read<EntireFreeCourseBloc>().add(FreeCourseFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
