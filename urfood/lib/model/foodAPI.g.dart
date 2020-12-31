// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foodAPI.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodList _$FoodListFromJson(Map<String, dynamic> json) {
  return FoodList(
    categories: (json['categories'] as List)
        ?.map(
            (e) => e == null ? null : Food.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FoodListToJson(FoodList instance) => <String, dynamic>{
      'categories': instance.categories,
    };

Food _$FoodFromJson(Map<String, dynamic> json) {
  return Food(
    strCategory: json['strCategory'] as String,
    strCategoryThumb: json['strCategoryThumb'] as String,
  );
}

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
    };
