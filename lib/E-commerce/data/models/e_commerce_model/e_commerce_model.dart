import 'package:json_annotation/json_annotation.dart';

part 'e_commerce_model.g.dart';

@JsonSerializable()
class EcommerceModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  EcommerceModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  factory EcommerceModel.fromJson(Map<String, dynamic> json) =>
      _$EcommerceModelFromJson(json);

  Map<String, dynamic> toJson() => _$EcommerceModelToJson(this);
}
