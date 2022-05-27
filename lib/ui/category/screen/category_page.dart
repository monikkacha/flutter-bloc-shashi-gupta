import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/ui/category/bloc/category_bloc.dart';
import 'package:weather_project/ui/category/bloc/category_state.dart';

import 'category_screeen.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(CategoryEmpty()),
      child: CategoryScreen(),
    );
  }
}
