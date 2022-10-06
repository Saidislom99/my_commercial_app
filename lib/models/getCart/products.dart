// [
// {
// "id": 1,
// "userId": 1,
// "date": "2020-03-02T00:00:02.000Z",
// "products": [

// ],
// "__v": 0
// },


// {
// "": 1,
// "quantity": 4
// },
// {
// "productId": 2,
// "": 1
// },
// {
// "productId": 3,
// "quantity": 6
// }

import 'package:json_annotation/json_annotation.dart';




part 'products.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(defaultValue: 0, name: 'productId')
  int productId;


  @JsonKey(defaultValue: 0, name: 'quantity')
  int quantity;



  Product({
    required this.productId,
    required this.quantity
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}




