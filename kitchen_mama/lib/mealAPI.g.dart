// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mealAPI.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealList _$MealListFromJson(Map<String, dynamic> json) {
  return MealList(
    meals: (json['meals'] as List)
        ?.map(
            (e) => e == null ? null : Meal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MealListToJson(MealList instance) => <String, dynamic>{
      'meals': instance.meals,
    };

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    strMeal: json['strMeal'] as String,
    strMealThumb: json['strMealThumb'] as String,
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
    };
