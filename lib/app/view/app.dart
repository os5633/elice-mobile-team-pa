import 'package:elice_mobile_team_pa/home/home.dart';
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
      child: MaterialApp(
        theme: ThemeData(fontFamily: GoogleFonts.roboto().fontFamily),
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (context) => const Home(),
              ),
            ],
          );
        },
      ),
    );
  }
}
