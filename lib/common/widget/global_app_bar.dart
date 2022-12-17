import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Widget? prefixIcon;
  final Color? color;
  final Widget? leading;
  final double? elevation;
  final Color? shadowColor;

  const GlobalAppBar(
      {Key? key,
      this.title,
      this.actions,
      this.color = AppColors.white,
      this.prefixIcon,
      this.leading,
      this.elevation,
      this.shadowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: title,
      actions: actions,
      leading: leading,
      backgroundColor: color,
      elevation: elevation,
      shadowColor: shadowColor ?? AppColors.black.withOpacity(0.02),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
