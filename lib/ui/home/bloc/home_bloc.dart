import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/ui/home/bloc/home_state.dart';
import 'package:weather_project/utils/api_service.dart';

import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent weatherEvent) async* {
    if (weatherEvent is FetchDataEvent) {
      yield* _getHomeData();
    }
  }

  Stream<HomeState> _getHomeData() async* {
    yield HomeLoading();
    var homeTop = await ApiService.getHomeTopData();
    var homeMiddle = await ApiService.getHomeMiddleData();
    var homeBottom = await ApiService.getHomeBottomData();
    try {
      if (homeTop[0] && homeMiddle[0] && homeBottom[0]) {
        yield HomeResultSuccess(
            homeTopResponse: homeTop[1],
            homeMiddleResponse: homeMiddle[1],
            homeBottomResponse: homeBottom[1]);
      } else {
        yield HomeResultError();
      }
    } catch (err) {
      yield HomeResultError();
    }
  }
}
