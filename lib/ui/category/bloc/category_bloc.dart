import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/ui/category/bloc/category_state.dart';
import 'package:weather_project/ui/home/bloc/home_state.dart';
import 'package:weather_project/utils/api_service.dart';

import 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(CategoryState initialState) : super(initialState);

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is FetchCategoryDataEvent) {
      yield* _getCategoryData();
    }
  }

  Stream<CategoryState> _getCategoryData() async* {
    yield CategoryLoading();
    var category = await ApiService.getCategoryData();
    try {
      if (category[0]) {
        yield CategoryResultSuccess(category[1]);
      } else {
        yield CategoryResultError();
      }
    } catch (err) {
      yield CategoryResultError();
    }
  }
}
