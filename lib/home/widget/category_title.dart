import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      title,
      style: AppTextStyle.subHead1.copyWith(
        color: AppColors.black,
      ),
    ));
  }
}
