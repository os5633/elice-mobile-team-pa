import 'package:elice_mobile_team_pa/app/app.dart';
import 'package:elice_mobile_team_pa/free_course/free_course.dart';
import 'package:elice_mobile_team_pa/recommended_course/recommended_course.dart';
import 'package:elice_mobile_team_pa/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.courseRepository,
  }) : super(key: key);

  final CourseRepository courseRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CourseRepository>(
          create: (context) => courseRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FreeCourseBloc>(
            create: (BuildContext context) =>
                FreeCourseBloc(courseRepository: courseRepository)
                  ..add(FreeCourseFetched()),
          ),
          BlocProvider<RecommendedCourseBloc>(
            create: (BuildContext context) =>
                RecommendedCourseBloc(courseRepository: courseRepository)
                  ..add(RecommendedCourseFetched()),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: router,
          theme: ThemeData(fontFamily: GoogleFonts.roboto().fontFamily),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
