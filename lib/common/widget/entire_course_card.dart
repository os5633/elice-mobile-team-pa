import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:elice_mobile_team_pa/repository/model/models.dart';
import 'package:flutter/material.dart';

class EntireCourseCard extends StatelessWidget {
  const EntireCourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  static const DISCOUNT_COURSE = "할인이 적용 된 코스입니다.";
  static const NO_DISCOUNT_COURSE = "할인이 적용되지 않은 코스입니다.";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 1000),
            content: Text(
              course.isDiscounted ? DISCOUNT_COURSE : NO_DISCOUNT_COURSE,
            ),
          ),
        ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            course.logoFileUrl == null
                ? const ErrorImageAsset(
                    width: 88,
                    height: 88,
                  )
                : CourseLogo(
                    imagePath: course.logoFileUrl!,
                    width: 88,
                    height: 88,
                  ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: AppTextStyle.head1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                  const InstructorFullName(),
                  const SizedBox(height: 4),
                  const ChipLabel()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
