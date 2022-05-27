
import 'dart:convert';

HomeTopResponse homeTopResponseFromJson(String str) =>
    HomeTopResponse.fromJson(json.decode(str));

String homeTopResponseToJson(HomeTopResponse data) =>
    json.encode(data.toJson());

class HomeTopResponse {
  HomeTopResponse({
    this.mainStickyMenu,
    this.status,
    this.message,
  });

  List<MainStickyMenu>? mainStickyMenu;
  String? status;
  String? message;

  factory HomeTopResponse.fromJson(Map<String, dynamic> json) =>
      HomeTopResponse(
        mainStickyMenu: List<MainStickyMenu>.from(
            json["main_sticky_menu"].map((x) => MainStickyMenu.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "main_sticky_menu":
            List<dynamic>.from(mainStickyMenu!.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class MainStickyMenu {
  MainStickyMenu({
    this.title,
    this.image,
    this.sortOrder,
    this.sliderImages,
    this.cta,
  });

  String? title;
  String? image;
  String? sortOrder;
  List<MainStickyMenu>? sliderImages;
  String? cta;

  factory MainStickyMenu.fromJson(Map<String, dynamic> json) => MainStickyMenu(
        title: json["title"],
        image: json["image"],
        sortOrder: json["sort_order"],
        sliderImages: json["slider_images"] == null
            ? null
            : List<MainStickyMenu>.from(
                json["slider_images"].map((x) => MainStickyMenu.fromJson(x))),
        cta: json["cta"] == null ? null : json["cta"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "sort_order": sortOrder,
        "slider_images": sliderImages == null
            ? null
            : List<dynamic>.from(sliderImages!.map((x) => x.toJson())),
        "cta": cta == null ? null : cta,
      };
}
