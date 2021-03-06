import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_harpreet/homepage/homepage_bloc.dart';
import 'package:portfolio_harpreet/theme/theme_bloc.dart';
import 'package:portfolio_harpreet/theme/theme_state.dart';
import 'package:portfolio_harpreet/ui/screens/home_page.dart';

void main() {
  return runApp(MyPortFolioApp());
}

class MyPortFolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeState == DarkThemeState()
                  ? ThemeData.dark()
                  : ThemeData.light(),
              home: BlocProvider(
                create: (context) => HomePageBloc(),
                child: Homepage(),
              ));
        },
      ),
    );
  }
}
