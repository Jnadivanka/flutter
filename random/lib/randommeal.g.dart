// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'randommeal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealList _$MealListFromJson(Map<String, dynamic> json) {
  return MealList(
    categories: json['categories'] as String,
  );
}

Map<String, dynamic> _$MealListToJson(MealList instance) => <String, dynamic>{
      'categories': instance.categories,
    };

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    strCategory: json['strCategory'] as String,
    strCategoryThumb: json['strCategoryThumb'] as String,
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
    };
