import 'package:flutter/material.dart';
import 'package:my_commercial_app/models/getCart/cart_top.dart';
import 'package:my_commercial_app/repository/repository.dart';

import '../../../local_data/local_database.dart';
import '../../../models/getAllProduct/product_item.dart';
import '../../../models/getUser/user.dart';
import '../../../service/api_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _HomeState();
}

class _HomeState extends State<CartScreen> {
  late MyRepository myRepository;
  List<ProductItem> products = [];
  List<UserItem> userItem = [];
  List<Cart> cart = [];

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    myRepository = MyRepository(
      apiProvider: ApiProvider(),
      localDatabase: LocalDatabase(),
    );
    products = await myRepository.getAllProducts();
    userItem = await myRepository.getAllUser();
    cart = await myRepository.getAllCart();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card screen"),
      ),
      body: ListView(
        children: List.generate(
            userItem.length,
            (index) => Container(
                margin: EdgeInsets.all(15),
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              userItem[index].username,
                              style:
                                  TextStyle(color: Colors.indigo, fontSize: 20),
                            ),
                            Text(
                              userItem[index].email,
                            )
                          ],
                        ),
                        const Icon(
                          Icons.account_balance_sharp,
                          size: 40,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      userItem[index].addressItem.city,
                      style: TextStyle(color: Colors.purple),
                    ),
                   // Text(cart[index].date.toString())
                  ],
                ))),
      ),
    );
  }
}
