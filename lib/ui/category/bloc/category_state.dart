import 'package:equatable/equatable.dart';
import 'package:weather_project/ui/category/model/category_response.dart';
import 'package:weather_project/ui/home/model/home_bottom_response.dart';
import 'package:weather_project/ui/home/model/home_middle_response.dart';
import 'package:weather_project/ui/home/model/home_top_response.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoryEmpty extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryResultSuccess extends CategoryState {
  final CategoryResponse categoryResponse;

  CategoryResultSuccess(this.categoryResponse);

  @override
  List<Object> get props => [categoryResponse];
}

class CategoryResultError extends CategoryState {}
