import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

part 'mealAPI.g.dart';

@JsonSerializable()
class MealList {
  MealList({this.meals});
  final List<Meal> meals;
  factory MealList.fromJson(Map<String, dynamic> json) =>
      _$MealListFromJson(json);
  Map<String, dynamic> toJson() => _$MealListToJson(this);
}

@JsonSerializable()
class Meal {
  Meal({this.strMeal, this.strMealThumb});
  final String strMeal;
  final String strMealThumb;
  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
  Map<String, dynamic> toJson() => _$MealToJson(this);
}

Future<MealList> getMealList() async {
  for (int i = 1; i <= 10; i += 1) {
    var url = 'https://www.themealdb.com/api/json/v1/1/random.php';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return MealList.fromJson(json.decode(response.body));
    } else {
      throw HttpException('Error ${response.reasonPhrase}',
          uri: Uri.parse(url));
    }
  }
}
