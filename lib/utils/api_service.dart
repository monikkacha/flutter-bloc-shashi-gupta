import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_project/ui/category/model/category_response.dart';
import 'package:weather_project/ui/home/model/home_bottom_response.dart';
import 'package:weather_project/ui/home/model/home_middle_response.dart';
import 'package:weather_project/ui/home/model/home_top_response.dart';

class ApiService {
  static var _baseUrl = "https://fabcurate.easternts.in/";

  static Future<dynamic> getHomeTopData() async {
    try {
      var endPoint = "top.json";
      var uri = Uri.parse(_baseUrl + endPoint);
      print("api request : " + uri.toString());
      var response = await http.get(uri);
      HomeTopResponse homeTopResponse =
          homeTopResponseFromJson(response.body.toString());
      print('HomeTopResponse : ${homeTopResponse.message}');
      return [true, homeTopResponse];
    } catch (err) {
      print("err : ${err}");
      return [false];
    }
  }
  static Future<dynamic> getHomeMiddleData() async {
    try {
      var endPoint = "middle.json";
      var uri = Uri.parse(_baseUrl + endPoint);
      print("api request : " + uri.toString());
      var response = await http.get(uri);
      HomeMiddleResponse homeMiddleResponse =
      homeMiddleResponseFromJson(response.body.toString());
      print('HomeMiddleResponse : ${homeMiddleResponse.message}');
      return [true, homeMiddleResponse];
    } catch (err) {
      print("err : ${err}");
      return [false];
    }
  }
  static Future<dynamic> getHomeBottomData() async {
    try {
      var endPoint = "bottom.json";
      var uri = Uri.parse(_baseUrl + endPoint);
      print("api request : " + uri.toString());
      var response = await http.get(uri);
      HomeBottomResponse homeBottomResponse =
      homeBottomResponseFromJson(response.body.toString());
      print('HomeBottomResponse : ${homeBottomResponse.message}');
      return [true, homeBottomResponse];
    } catch (err) {
      print("err : ${err}");
      return [false];
    }
  }
  static Future<dynamic> getCategoryData() async {
    try {
      var endPoint = "category.json";
      var uri = Uri.parse(_baseUrl + endPoint);
      print("api request : " + uri.toString());
      var response = await http.get(uri);
      CategoryResponse categoryResponse =
      categoryResponseFromJson(response.body.toString());
      print('HomeBottomResponse : ${categoryResponse.message}');
      return [true, categoryResponse];
    } catch (err) {
      print("err : ${err}");
      return [false];
    }
  }
}
