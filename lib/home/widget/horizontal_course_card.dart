import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:elice_mobile_team_pa/repository/model/models.dart';
import 'package:flutter/material.dart';

class HorizontalCourseCard extends StatelessWidget {
  const HorizontalCourseCard(
      {Key? key, required this.course, required this.index})
      : super(key: key);

  final Course course;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 10.0,
              offset: const Offset(4.0, 4.0),
            ),
          ],
        ),
        margin: EdgeInsets.only(
          left: index == 0 ? 16 : 0,
          right: index == 9 ? 16 : 0,
        ),
        width: 160,
        height: 200,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.purple1,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
              height: 136,
              padding: const EdgeInsets.only(right: 12, left: 12, top: 16),
              child: Column(
                children: [
                  course.logoFileUrl == null
                      ? const ErrorImageAsset()
                      : CourseLogo(
                          imagePath: course.logoFileUrl!,
                          width: 44,
                          height: 44,
                        ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    course.title,
                    style: AppTextStyle.head1.copyWith(
                      color: AppColors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InstructorFullName(
                    fullName: course.instructors.isNotEmpty
                        ? course.instructors[0].fullName
                        : null,
                  ),
                  const ChipLabel()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
