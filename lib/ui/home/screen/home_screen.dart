import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/ui/home/bloc/home_bloc.dart';
import 'package:weather_project/ui/home/bloc/home_event.dart';
import 'package:weather_project/ui/home/bloc/home_state.dart';
import 'package:weather_project/ui/home/model/home_bottom_response.dart';
import 'package:weather_project/ui/home/model/home_middle_response.dart';
import 'package:weather_project/ui/home/model/home_top_response.dart';
import 'package:weather_project/ui_widgets/boutique_item/boutique_item.dart';
import 'package:weather_project/ui_widgets/design_as_per_occassion/design_as_per_occassion_item.dart';
import 'package:weather_project/ui_widgets/menu_card/menu_card.dart';
import 'package:weather_project/ui_widgets/menu_slider_item/menu_slider_item.dart';
import 'package:weather_project/ui_widgets/range_of_pattern_item/range_of_pattern_item.dart';
import 'package:weather_project/ui_widgets/shop_by_category_item/shop_by_category_item.dart';
import 'package:weather_project/ui_widgets/shop_by_fabric_item/shop_by_fabric_item.dart';
import 'package:weather_project/ui_widgets/unstich_item/unstich_item.dart';
import 'package:weather_project/utils/app_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;
  late HomeTopResponse homeTopResponse;
  late HomeMiddleResponse homeMiddleResponse;
  late HomeBottomResponse homeBottomResponse;
  List<ShopBy> shopByCategory1 = [];
  List<ShopBy> shopByCategory2 = [];
  List<ShopBy> shopByFabric1 = [];
  List<ShopBy> shopByFabric2 = [];
  List<RangeOfPattern> rangeOfPattern1 = [];
  List<RangeOfPattern> rangeOfPattern2 = [];

  int selectedMenuItem = 0;
  int selectedBoutiqueItemCarousel = 0;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    initData();
  }

  initData() {
    homeBloc.add(FetchDataEvent());
  }

  initShopCategoryData() {
    int middlePoint = (homeMiddleResponse.shopByCategory!.length / 2).toInt();
    int length = homeMiddleResponse.shopByCategory!.length;
    for (int i = 0; i < middlePoint; i++) {
      shopByCategory1.add(homeMiddleResponse.shopByCategory![i]);
    }
    for (int i = middlePoint; i < length; i++) {
      shopByCategory2.add(homeMiddleResponse.shopByCategory![i]);
    }
  }

  initShopByFabricData() {
    int middlePoint = (homeMiddleResponse.shopByFabric!.length / 2).toInt();
    int length = homeMiddleResponse.shopByFabric!.length;
    for (int i = 0; i < middlePoint; i++) {
      shopByFabric1.add(homeMiddleResponse.shopByFabric![i]);
    }
    for (int i = middlePoint; i < length; i++) {
      shopByFabric2.add(homeMiddleResponse.shopByFabric![i]);
    }
  }

  initRangeOfPatternData() {
    int middlePoint = (homeBottomResponse.rangeOfPattern!.length / 2).toInt();
    int length = homeBottomResponse.rangeOfPattern!.length;
    for (int i = 0; i < middlePoint; i++) {
      rangeOfPattern1.add(homeBottomResponse.rangeOfPattern![i]);
    }
    for (int i = middlePoint; i < length; i++) {
      rangeOfPattern2.add(homeBottomResponse.rangeOfPattern![i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(builder: (_, state) {
      if (state is HomeLoading) {
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is HomeResultSuccess) {
        return getBody();
      }
      return Container();
    }, listener: (_, state) {
      if (state is HomeResultSuccess) {
        homeTopResponse = state.homeTopResponse;
        homeMiddleResponse = state.homeMiddleResponse;
        homeBottomResponse = state.homeBottomResponse;
        initShopCategoryData();
        initShopByFabricData();
        initRangeOfPatternData();
        setState(() {});
      }
    });
  }

  getBody() => ListView(
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        children: [
          getTopBar(),
          SizedBox(
            height: 10.0,
          ),
          getTopCarousel(),
          SizedBox(
            height: 10.0,
          ),
          getShopCategoryData(),
          SizedBox(
            height: 10.0,
          ),
          getShopByFabricData(),
          SizedBox(
            height: 10.0,
          ),
          getStichedData(),
          SizedBox(
            height: 10.0,
          ),
          getBoutiqueCollection(),
          SizedBox(
            height: 10.0,
          ),
          rangeOfPatternDataData(),
          SizedBox(
            height: 10.0,
          ),
          designAsPerOccassion(),
        ],
      );

  getTopBar() => Container(
        padding: EdgeInsets.only(left: 10.0),
        height: 100.0,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: homeTopResponse.mainStickyMenu!.length,
            itemBuilder: (context, index) => MenuCard(
                  homeTopResponse.mainStickyMenu![index].image!,
                  homeTopResponse.mainStickyMenu![index].title!,
                  onTap: () {
                    selectedMenuItem = index;
                    print('index : $index');
                    setState(() {});
                  },
                )),
      );

  getTopCarousel() => Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imageMenuSliders(),
        ),
      );

  List<Widget> imageMenuSliders() {
    return homeTopResponse.mainStickyMenu![selectedMenuItem].sliderImages!
        .map((item) => MenuSliderItem(
              title: homeTopResponse.mainStickyMenu![selectedMenuItem].title!,
              image: item.image!,
            ))
        .toList();
  }

  List<Widget> imageUnstichedSliders() {
    return homeMiddleResponse.unstitched!
        .map((item) => UnstichItem(
              image: item.image!,
            ))
        .toList();
  }

  List<Widget> imageBoutiqueSliders() {
    return homeMiddleResponse.boutiqueCollection!
        .map((item) => BoutiqueItem(
              item: item,
            ))
        .toList();
  }

  getShopCategoryData() => Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Text(
              AppString.shop_by_category,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            shopByCategoryList(shopByCategory1),
            SizedBox(height: 10.0),
            shopByCategoryList(shopByCategory2),
          ],
        ),
      );

  shopByCategoryList(list) => Container(
        height: 190.0,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) => ShopByCategoryItem(list[index])),
      );

  getShopByFabricData() => Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Text(
              AppString.shop_by_fabric,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            shopByFabric(shopByFabric1),
            SizedBox(height: 10.0),
            shopByFabric(shopByFabric2),
          ],
        ),
      );

  shopByFabric(list) => Container(
        height: 140.0,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) => ShopByFabricItem(list[index])),
      );

  getStichedData() => Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Text(
              AppString.unstiched,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            getStitchingCarousel(),
          ],
        ),
      );

  getStitchingCarousel() => Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 0.7,
            aspectRatio: 1.0,
            enlargeCenterPage: true,
          ),
          items: imageUnstichedSliders(),
        ),
      );

  getBoutiqueCollection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              AppString.boutique_collection,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(height: 10.0),
          getBoutiqueCarousel(),
          SizedBox(height: 10.0),
          boutiqueSliderIndicator(),
          SizedBox(height: 10.0),
        ],
      );

  boutiqueSliderIndicator() => Container(
        height: 24.0,
        alignment: Alignment.center,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: homeMiddleResponse.boutiqueCollection!.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.fiber_manual_record,
                    size: selectedBoutiqueItemCarousel == index ? 18.0 : 12.0,
                    color: selectedBoutiqueItemCarousel == index
                        ? Colors.black
                        : Colors.black.withOpacity(0.5),
                  ),
                )),
      );

  getBoutiqueCarousel() => Container(
        child: CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              height: 450.0,
              onPageChanged: (index, reason) {
                selectedBoutiqueItemCarousel = index;
                setState(() {});
              }),
          items: imageBoutiqueSliders(),
        ),
      );

  rangeOfPatternDataData() => Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Text(
              AppString.range_of_pattern,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            rangeOfPattern(rangeOfPattern1),
            SizedBox(height: 10.0),
            rangeOfPattern(rangeOfPattern2),
          ],
        ),
      );

  rangeOfPattern(list) => Container(
        height: 140.0,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) => RangeOfPatternItem(list[index])),
      );

  designAsPerOccassion() => Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Text(
              AppString.design_as_per_occasion,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            getOccasionList()
          ],
        ),
      );

  getOccasionList() => Container(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: homeBottomResponse.designOccasion!.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return DesignAsPerOccassionItem(
                homeBottomResponse.designOccasion![index]);
          },
        ),
      );
}
