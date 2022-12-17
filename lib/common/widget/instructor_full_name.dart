import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:flutter/material.dart';

class InstructorFullName extends StatelessWidget {
  const InstructorFullName({
    Key? key,
    this.fullName,
  }) : super(key: key);

  final String? fullName;

  static const EMPTY_FULL_NAME = "선생님 미등록";

  @override
  Widget build(BuildContext context) {
    return Text(
      fullName ?? EMPTY_FULL_NAME,
      style: AppTextStyle.subHead3.copyWith(
        color: AppColors.grey2,
      ),
    );
  }
}
