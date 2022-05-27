import 'package:equatable/equatable.dart';
import 'package:weather_project/ui/home/model/home_bottom_response.dart';
import 'package:weather_project/ui/home/model/home_middle_response.dart';
import 'package:weather_project/ui/home/model/home_top_response.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeEmpty extends HomeState {}

class HomeLoading extends HomeState {}

class HomeResultSuccess extends HomeState {
  final HomeTopResponse homeTopResponse;
  final HomeMiddleResponse homeMiddleResponse;
  final HomeBottomResponse homeBottomResponse;

  HomeResultSuccess(
      {required this.homeTopResponse,
      required this.homeMiddleResponse,
      required this.homeBottomResponse});

  @override
  List<Object> get props =>
      [homeTopResponse, homeMiddleResponse, homeBottomResponse];
}

class HomeResultError extends HomeState {}
