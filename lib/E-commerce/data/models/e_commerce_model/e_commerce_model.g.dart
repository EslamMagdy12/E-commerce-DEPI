// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_commerce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcommerceModel _$EcommerceModelFromJson(Map<String, dynamic> json) =>
    EcommerceModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$EcommerceModelToJson(EcommerceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
    };
