import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'foodAPI.g.dart';

@JsonSerializable()
class FoodList {
  FoodList({this.categories});
  final List<Food> categories;
  factory FoodList.fromJson(Map<String, dynamic> json) =>
      _$FoodListFromJson(json);
  Map<String, dynamic> toJson() => _$FoodListToJson(this);
}

@JsonSerializable()
class Food {
  Food({this.strCategory, this.strCategoryDescription, this.strCategoryThumb});
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;
  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
  Map<String, dynamic> toJson() => _$FoodToJson(this);
}

Future<FoodList> getFoodList() async {
  String url = 'https://www.themealdb.com/api/json/v1/1/categories.php';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return FoodList.fromJson(json.decode(response.body));
  } else {
    throw HttpException('Error ${response.reasonPhrase}', uri: Uri.parse(url));
  }
}
