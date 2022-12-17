import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:flutter/material.dart';

class ChipLabel extends StatelessWidget {
  const ChipLabel({
    Key? key,
  }) : super(key: key);

  static const LABEL_NAME = "오프라인";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      margin: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        color: AppColors.blue1,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        LABEL_NAME,
        style: AppTextStyle.subHead4.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
