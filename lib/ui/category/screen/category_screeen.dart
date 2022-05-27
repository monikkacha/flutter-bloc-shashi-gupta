import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/ui/category/bloc/category_bloc.dart';
import 'package:weather_project/ui/category/bloc/category_event.dart';
import 'package:weather_project/ui/category/bloc/category_state.dart';
import 'package:weather_project/ui/category/model/category_response.dart';
import 'package:weather_project/ui_widgets/category_item/category_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late CategoryBloc categoryBloc;
  late CategoryResponse categoryResponse;
  int selectedMenuItem = 0;
  int selectedBoutiqueItemCarousel = 0;

  @override
  void initState() {
    super.initState();
    categoryBloc = BlocProvider.of<CategoryBloc>(context);
    initData();
  }

  initData() {
    categoryBloc.add(FetchCategoryDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(builder: (_, state) {
      if (state is CategoryLoading) {
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is CategoryResultSuccess) {
        return getBody();
      }
      return Container();
    }, listener: (_, state) {
      if (state is CategoryResultSuccess) {
        categoryResponse = state.categoryResponse;
        setState(() {});
      }
    });
  }

  getBody() => ListView(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        children: [
          Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: categoryResponse.categories!.length,
                  itemBuilder: (_, index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CategoryItem(
                            name: categoryResponse
                                .categories![index].categoryName!,
                            bannerImage: categoryResponse.bannerImage!,
                            isParentCategory: true,
                          ),
                          ListView.builder(
                              itemCount: categoryResponse
                                  .categories![index].child!.length,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, innerIndex) =>
                                  CategoryItem(
                                      name: categoryResponse.categories![index]
                                          .child![innerIndex].categoryName!,
                                      bannerImage:
                                          categoryResponse.bannerImage!))
                        ],
                      )))
        ],
      );
}
