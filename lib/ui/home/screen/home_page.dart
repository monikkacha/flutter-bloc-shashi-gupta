import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/ui/home/bloc/home_bloc.dart';
import 'package:weather_project/ui/home/bloc/home_state.dart';
import 'package:weather_project/ui/home/screen/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(HomeEmpty()),
      child: HomeScreen(),
    );
  }
}
