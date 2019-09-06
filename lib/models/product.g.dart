// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    brand: json['brand'] as String,
    imgUrl: json['imgUrl'] as String,
    isNew: json['isNew'] as bool,
    price: (json['price'] as num)?.toDouble(),
    selectedColor: json['selectedColor'],
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imgUrl': instance.imgUrl,
      'brand': instance.brand,
      'price': instance.price,
      'isNew': instance.isNew,
      'selectedColor': instance.selectedColor,
      'quantity': instance.quantity,
    };
