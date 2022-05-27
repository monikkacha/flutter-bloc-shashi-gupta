// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromJson(jsonString);

import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) => CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) => json.encode(data.toJson());

class CategoryResponse {
  CategoryResponse({
    this.categories,
    this.bannerImage,
    this.status,
    this.message,
  });

  List<Category>? categories;
  String? bannerImage;
  String? status;
  String? message;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    bannerImage: json["banner_image"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    "banner_image": bannerImage,
    "status": status,
    "message": message,
  };
}

class Category {
  Category({
    this.categoryId,
    this.categoryName,
    this.parentId,
    this.child,
  });

  String? categoryId;
  String? categoryName;
  String? parentId;
  List<Category>? child;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    parentId: json["parent_id"],
    child: json["child"] == null ? null : List<Category>.from(json["child"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "parent_id": parentId,
    "child": child == null ? null : List<dynamic>.from(child!.map((x) => x.toJson())),
  };
}
