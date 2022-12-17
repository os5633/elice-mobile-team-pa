import 'package:bloc/bloc.dart';
import 'package:elice_mobile_team_pa/app/app.dart';
import 'package:elice_mobile_team_pa/repository/repository.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  final courseRepository = CourseRepository();
  Bloc.observer = AppBlocObserver();
  return runApp(App(courseRepository: courseRepository));
}
