import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:elice_mobile_team_pa/home/home.dart';
import 'package:elice_mobile_team_pa/repository/model/models.dart';
import 'package:flutter/material.dart';

class HorizontalCourses extends StatelessWidget {
  const HorizontalCourses({
    Key? key,
    required this.courses,
    required this.courseType,
  }) : super(key: key);

  final List<Course> courses;
  final CourseType courseType;

  static const RECOMMENDED_COURSE_TITLE = "추천과목";
  static const FREE_COURSE_TITLE = "무료과목";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 12),
          child: Row(
            children: [
              CategoryTitle(
                title: courseType == CourseType.recommended
                    ? RECOMMENDED_COURSE_TITLE
                    : FREE_COURSE_TITLE,
              ),
              ViewEntireCourseButton(
                onTap: () => {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 11),
        SizedBox(
          height: 216,
          child: courses.isEmpty
              ? const EmptyCourse()
              : ListView.separated(
                  key: PageStorageKey(courses.hashCode),
                  padding: const EdgeInsets.only(bottom: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length > 10 ? 10 : courses.length,
                  itemBuilder: (context, index) => HorizontalCourseCard(
                    course: courses[index],
                    index: index,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 13),
                ),
        ),
      ],
    );
  }
}
