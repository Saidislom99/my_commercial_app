import 'package:json_annotation/json_annotation.dart';
import 'package:my_commercial_app/models/getCart/products.dart';




part 'cart_top.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: 0, name: 'userId')
  int userId;

  @JsonKey(defaultValue: 0, name: '__v')
  int vvv;

  @JsonKey(defaultValue: '', name: 'date')
  String date;




  @JsonKey(defaultValue: const [], name: 'products')
  List<Product> products;

  Cart({
    required this.vvv,
    required this.id,
    required this.products,
    required this.date,
    required this.userId,
  });

  factory Cart.fromJson(Map<String, dynamic> json) =>
      _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
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



