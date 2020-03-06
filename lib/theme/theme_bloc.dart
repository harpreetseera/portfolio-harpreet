import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_harpreet/theme/theme_event.dart';
import 'package:portfolio_harpreet/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => LightThemeState();

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.Toggle:
        ThemeState stateToYield =
            (state == LightThemeState()) ? DarkThemeState() : LightThemeState();
        yield stateToYield;
        print("state yielded - $stateToYield");
    }
  }
}
