import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/searchbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../objects/product.dart';
import '../widgets/category_card.dart';

final productListProvider = Provider<List<Product>>(
  (ref) => [
    Product("Hauptgericht", "Wiener", "mit Pommes und Salat", "17.40"),
    Product("Desert", "Eisbecher", "1 Kugel Erdbeere und Vanille", "17.40"),
    Product("Getränk", "Cola", "0,5", "3.40"),
    Product("Hauptgericht", "Burger", "mit Pommes und Salat", "14.40"),
    Product("Desert", "Mohr im Hemd", "Kuchen mit Schokolade", "5.80"),
    Product("Getränk", "Fanta", "0,5", "3.40"),
  ],
);

class ProductScreen extends ConsumerWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> products = ref.watch(productListProvider);

    Map<String, List<Product>> map = {};
    Set<String> categorys = {};

    // put all categorys in the set
    for (var product in products) {
      categorys.add(product.category);
    }

    // product list gets maped by the category
    for (var category in categorys) {
      List<Product> list = [];
      list = products
          .where((product) => product.category.contains(category))
          .toList();
      map[category] = list;
    }

    List<List<Product>> displayList = map.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Menu"),
        actions: [
          IconButton(
            onPressed: () => print("jellosdasd"),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 34,
            child: Searchbar(
              categorys.toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                return CategoryCard(displayList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
