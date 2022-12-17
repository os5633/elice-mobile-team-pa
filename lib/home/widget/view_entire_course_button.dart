import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:flutter/material.dart';

class ViewEntireCourseButton extends StatelessWidget {
  const ViewEntireCourseButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  static const BUTTON_NAME = "전체보기";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          BUTTON_NAME,
          style: AppTextStyle.subHead2.copyWith(
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
