import 'package:elice_mobile_team_pa/free_course/free_course.dart';
import 'package:elice_mobile_team_pa/home/home.dart';
import 'package:elice_mobile_team_pa/recommended_course/recommended_course.dart';
import 'package:elice_mobile_team_pa/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'entireFreeCourse',
          builder: (BuildContext context, GoRouterState state) =>
              BlocProvider<EntireFreeCourseBloc>(
            create: (context) =>
                EntireFreeCourseBloc(context.read<CourseRepository>())
                  ..add(FreeCourseFetched()),
            child: const EntireFreeCourse(),
          ),
        ),
        GoRoute(
          path: 'entireRecommendedCourse',
          builder: (BuildContext context, GoRouterState state) =>
              BlocProvider<EntireRecommendedCourseBloc>(
                  create: (context) => EntireRecommendedCourseBloc(
                      context.read<CourseRepository>())
                    ..add(RecommendedCourseFetched()),
                  child: const EntireRecommendedCourse()),
        ),
      ],
    ),
  ],
);
