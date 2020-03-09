import 'package:equatable/equatable.dart';

class HomePageState extends Equatable {
  @override
  List<Object> get props => [];
}

class ImageUrlDownloadedState extends HomePageState {
  final String mainImageurl;
  ImageUrlDownloadedState({this.mainImageurl});
  @override
  List<Object> get props => [mainImageurl];
}

class InitialHomePageState extends HomePageState {}
