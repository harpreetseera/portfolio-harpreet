import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_harpreet/homepage/homepage_event.dart';
import 'package:portfolio_harpreet/homepage/homepage_state.dart';
import 'package:portfolio_harpreet/repository/repository.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  String userImageUrl;
  @override
  HomePageState get initialState => InitialHomePageState();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event == LoadImageEvent()) {
      userImageUrl = await Repository().getImageUrl("happy.jpg");
      yield ImageUrlDownloadedState();
    }
  }
}
