import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

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
  Food({this.strCategory, this.strCategoryThumb});
  final String strCategory;
  final String strCategoryThumb;
  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
  Map<String, dynamic> toJson() => _$FoodToJson(this);
}

Future<FoodList> getFoodList() async {
  const apiURL = "https://www.themealdb.com/api/json/v1/1/categories.php";
  final response = await http.get(apiURL);
  if (response.statusCode == 200) {
    return FoodList.fromJson(json.decode(response.body));
  } else {
    throw HttpException('Error ${response.reasonPhrase}',
        uri: Uri.parse(apiURL));
  }
}
