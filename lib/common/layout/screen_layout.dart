import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({
    Key? key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.backgroundColor = AppColors.grey1,
  }) : super(key: key);
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      body: body,
    );
  }
}
