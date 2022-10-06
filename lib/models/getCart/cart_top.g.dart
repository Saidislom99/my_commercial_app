// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_top.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      vvv: json['__v'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      date: json['date'] as String? ?? '',
      userId: json['userId'] as int? ?? 0,
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      '__v': instance.vvv,
      'date': instance.date,
      'products': instance.products,
    };
