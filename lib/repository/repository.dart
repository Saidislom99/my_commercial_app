import 'package:my_commercial_app/local_data/local_database.dart';
import 'package:my_commercial_app/models/getCart/cart_top.dart';
import 'package:my_commercial_app/models/getUser/user.dart';

import '../local_data/storage.dart';
import '../models/getAllProduct/product_item.dart';
import '../service/api_provider.dart';

class MyRepository {
  MyRepository({
    required this.apiProvider,
    required this.localDatabase,
  });

  final ApiProvider apiProvider;
  final LocalDatabase localDatabase;

  // ---------------------User-----------------
   //  Hamma USerlarni olish
  Future<List<UserItem>> getAllUser()=> apiProvider.getAllUser();

  Future<UserItem> getSingleUser(int userId) =>
      apiProvider.getSingleUser(userId: userId);

// ----------------------Cart--------------------

  // Hamma cart olib keladi
  Future<List<Cart>> getAllCart()=> apiProvider.getAllCart();
  // ------------------------------Products--------------
  // Hamma productlarni olib keladi
  Future<List<ProductItem>> getAllProducts() => apiProvider.getProductsList();

  // Bitta productni olib keladi
  Future<ProductItem> getSingleProduct(int productId) =>
      apiProvider.getSingleProduct(productId: productId);
 // Productga yangi product qo'shish
  Future<ProductItem> addProductToServer(ProductItem productItem) =>
      apiProvider.addNewProductToServer(productItem: productItem);


  // Categorylar
  Future<List<String>> getAllCategories() => apiProvider.getAllCategories();
  Future<List<ProductItem>> getSpecificCategoryProducts(String categoryName) =>
      apiProvider.getSpecificCategoryProducts(
        categoryName: categoryName,
      );

  Future<String> loginUser(
      {required String username, required String password}) =>
      apiProvider.loginUser(username: username, password: password);

  static Future<void> saveToken({required String token}) async {
    await StorageRepository.getInstance();
    await StorageRepository.putString(key: "token", value: token);
  }
}

