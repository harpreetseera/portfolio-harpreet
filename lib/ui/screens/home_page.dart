import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_harpreet/theme/theme_bloc.dart';
import 'package:portfolio_harpreet/theme/theme_event.dart';
import 'package:portfolio_harpreet/theme/theme_state.dart';
import 'package:portfolio_harpreet/ui/helper_widgets/curve_painter.dart';

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
      // appBar: AppBar(
      //   title: Text("Harpreet's PortFolio"),
      //   actions: <Widget>[
      //     BlocBuilder<ThemeBloc, ThemeState>(
      //       builder: (context, themeState) => IconButton(
      //         icon: Icon(themeState == DarkThemeState()
      //             ? Icons.lightbulb_outline
      //             : Icons.brightness_3),
      //         onPressed: () {
      //           BlocProvider.of<ThemeBloc>(context).add(ThemeEvent.Toggle);
      //         },
      //       ),
      //     ),
      //   ],
      // ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) => Container(
            color: themeState == LightThemeState()
                ? Colors.lime[100]
                : Colors.black,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                
                    LayoutBuilder(
                      builder: (context,constraints){return Container(
                        width:constraints.maxWidth<500? double.maxFinite:MediaQuery.of(context).size.width/2,
                        height: MediaQuery.of(context).size.height / 2,
                        child: CustomPaint(
                          painter: CurvePainter(
                            upperLayerColor: themeState == LightThemeState()
                                ? Colors.green
                                : Colors.grey,
                            loweLayerColor: themeState == LightThemeState()
                                ? Colors.lime
                                : Colors.grey,
                          ),
                        ),
                      );},
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 56,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: IconButton(
                                icon: Icon(themeState == DarkThemeState()
                                    ? Icons.lightbulb_outline
                                    : Icons.brightness_3),
                                onPressed: () {
                                  BlocProvider.of<ThemeBloc>(context)
                                      .add(ThemeEvent.Toggle);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
