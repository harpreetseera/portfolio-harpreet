import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_harpreet/theme/theme_bloc.dart';
import 'package:portfolio_harpreet/theme/theme_event.dart';
import 'package:portfolio_harpreet/theme/theme_state.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomepageState();
  }
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harpreet's PortFolio"),
        actions: <Widget>[
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) => IconButton(
              icon: Icon(themeState == DarkThemeState()
                  ? Icons.lightbulb_outline
                  : Icons.brightness_3),
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(ThemeEvent.Toggle);
              },
            ),
          ),
        ],
      ),
    );
  }
}
