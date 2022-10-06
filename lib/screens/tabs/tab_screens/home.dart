import 'package:flutter/material.dart';

import '../../../local_data/local_database.dart';
import '../../../models/getAllProduct/product_item.dart';
import '../../../repository/repository.dart';
import '../../../service/api_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  late MyRepository myRepository;
  int selectedCategory = 0;
  List<ProductItem> products = [];
  List<String> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void updateUI(String categoryName) async {
    isLoading = true;
    products = await myRepository.getSpecificCategoryProducts(categoryName);
    isLoading = false;
    setState(() {});
  }

  void _init() async {
    myRepository = MyRepository(
      apiProvider: ApiProvider(),
      localDatabase: LocalDatabase(),
    );
    categories = await myRepository.getAllCategories();
    products = await myRepository.getAllProducts();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        appBar: AppBar(
          title: const Text("First screen"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                categories.length,
                (index) => GestureDetector(
                  onTap: () async {
                    selectedCategory = index;
                    setState(() {});
                    updateUI(categories[index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                        color: selectedCategory == index
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: Colors.grey.shade400, width: 1.5)),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: selectedCategory != index
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: !isLoading,
            child: Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 12,
                childAspectRatio: 0.4,
                children: List.generate(
                    products.length,
                    (index) => Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.network(products[index].image),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        products[index].title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(products[index].price.toString()),
                                      TextButton(
                                          onPressed: () {},
                                          child: Container(
                                            width: 160,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Color(0xFFFFA4FF)),
                                            child: const Center(
                                                child: Text(
                                              "Buy",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            )),
                                          ))
                                    ],
                                  ))
                            ],
                          ),
                        )),
              ),
            ),
          ),
          Visibility(
            visible: isLoading,
            child: Expanded(
                child: GridView.count(
              padding: EdgeInsets.all(12),
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 12,
              childAspectRatio: 0.6,
              children: List.generate(
                15,
                (index) => Container(
                  color: Colors.grey,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            )),
          )
        ]));
  }
}
