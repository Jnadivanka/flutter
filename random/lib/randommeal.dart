import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

part 'randommeal.g.dart';

@JsonSerializable()
class MealList {
  final String categories;
  MealList({this.categories});
  factory MealList.fromJson(Map<String, dynamic> json) => _$MealListFromJson(json);
  Map<String, dynamic> toJson() => _$MealListToJson(this);
}

@JsonSerializable()
class Meal {
  final String strCategory;
  final String strCategoryThumb;
  Meal({this.strCategory, this.strCategoryThumb});
  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
  Map<String, dynamic> toJson() => _$MealToJson(this);
}

Future<MealList> getMealList() async{
  const String apiURL = 'https://www.themealdb.com/api/json/v1/1/categories.php';
  final http.Response response = await http.get(apiURL);
  if(response.statusCode == 200){
    return MealList.fromJson(json.decode(response.body));
  }else{
    throw HttpException('Error ${response.reasonPhrase}', uri: Uri.parse(apiURL));
  }
}