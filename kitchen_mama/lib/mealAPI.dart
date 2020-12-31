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
  Map<String, dynamic> toJson() => _MealListToJson(this);
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
  const url = '';
}
