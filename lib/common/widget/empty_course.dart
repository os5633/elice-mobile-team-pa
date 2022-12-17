import 'package:flutter/material.dart';

class EmptyCourse extends StatelessWidget {
  const EmptyCourse({
    Key? key,
    this.message,
  }) : super(key: key);

  final String? message;
  static const EMPTY_COURSE = "콘텐츠가 없습니다";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? EMPTY_COURSE,
        textAlign: TextAlign.center,
      ),
    );
  }
}
