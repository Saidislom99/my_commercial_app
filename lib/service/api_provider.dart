import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import 'package:my_commercial_app/models/getUser/user.dart';

import '../models/getAllProduct/product_item.dart';
import '../models/getCart/cart_top.dart';

class ApiProvider {


  // ----------------------Product--------------------------

  // Serverdan barcha mahsulotlarni olib keladi
  Future<List<ProductItem>> getProductsList() async {
    try {
      Response response =
      await https.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
        List<ProductItem> products = (jsonDecode(response.body) as List?)
            ?.map((item) => ProductItem.fromJson(item))
            .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  //Serverdan bergan sonimizcha mahsulot olib keladi
  Future<List<ProductItem>> getLimitedList({required limitedCount}) async {
    try {
      Response response = await https.get(
          Uri.parse("https://fakestoreapi.com/products?limit=$limitedCount"));
      if (response.statusCode == 200) {
        List<ProductItem> products = (jsonDecode(response.body) as List?)
            ?.map((item) => ProductItem.fromJson(item))
            .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  // Serverdan yagona mahsulot haqida ma'lumot qaytaradi
  Future<ProductItem> getSingleProduct({
    required int productId,
  }) async {
    try {
      Response response = await https
          .get(Uri.parse("https://fakestoreapi.com/products/$productId"));
      if (response.statusCode == 200) {
        return ProductItem.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  //Serverga yagona mahsulot qo'shish

  Future<ProductItem> addNewProductToServer(
      {required ProductItem productItem}) async {
    try {
      Response response = await https
          .post(Uri.parse("https://fakestoreapi.com/products"), body: {
        "title": productItem.title,
        "price": productItem.price,
        "description": productItem.description,
        "image": productItem.image,
        "category": productItem.category
      });
      if (response.statusCode == 200) {
        return ProductItem.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  // Get All Categories
  Future<List<String>> getAllCategories()async{
    try{
      Response response= await https
          .get(Uri.parse("https://fakestoreapi.com/products/categories"));
      if (response.statusCode==200){
        return (jsonDecode(response.body) as List <dynamic>?)?.map((e) => e as String).toList() ?? [];
      }else{
        throw Exception();
      }
    } catch (e){
      throw Exception(e);
    }
  }

  // Saralangan mahsulotlar
  Future<List<ProductItem>> getSpecificCategoryProducts({
    required String categoryName,
  }) async {
    try {
      Response response = await https.get(Uri.parse(
          "https://fakestoreapi.com/products/category/$categoryName"));
      if (response.statusCode == 200) {
        List<ProductItem> products = (jsonDecode(response.body) as List?)
            ?.map((item) => ProductItem.fromJson(item))
            .toList() ??
            [];
        print("Products:${products.toString()}");
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // -------------------------Login va password TOKEN---------------------------
  Future<String> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      Response response = await https.post(
          Uri.parse("https://fakestoreapi.com/auth/login"),
          body: {"username": username, "password": password});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['token'];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }


  //----------------------User---------------------
   // Hamma userlarni olib keladi
  Future<List<UserItem>> getAllUser() async {
    try {
      Response response =
      await https.get(Uri.parse("https://fakestoreapi.com/users"));
      if (response.statusCode == 200) {
        List<UserItem> userItem = (jsonDecode(response.body) as List?)
            ?.map((item) => UserItem.fromJson(item))
            .toList() ??
            [];
        return userItem;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  // Yagona Userni olib keladi
  Future<UserItem> getSingleUser({
    required int userId,
  }) async {
    try {
      Response response = await https
          .get(Uri.parse("https://fakestoreapi.com/users/$userId"));
      if (response.statusCode == 200) {
        return UserItem.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }



  // -----------------------Cart--------------
  // Hamma Cartlarni olib keladi
  Future<List<Cart>> getAllCart() async {
    try {
      Response response =
      await https.
      get(Uri.parse("https://fakestoreapi.com/carts"));
      if (response.statusCode == 200) {
        List<Cart> cart = (jsonDecode(response.body) as List?)
            ?.map((item) => Cart.fromJson(item))
            .toList() ??
            [];
        return cart;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

}