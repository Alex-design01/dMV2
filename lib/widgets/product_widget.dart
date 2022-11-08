import 'package:flutter/material.dart';
import '../objects/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(product.name),
        subtitle: Text(product.description),
        onTap: () => bottomsheet(context),
        trailing: Text(
          "€${product.price}",
        ));
  }

  Future<dynamic> bottomsheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(product.description),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Anmerkungen",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.lightBlue),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => print("asdasd"),
                            icon: Icon(Icons.add_circle_outline),
                            color: Colors.white,
                          ),
                          Text(
                            "1",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () => print("asdasd"),
                            icon: Icon(Icons.remove_circle_outline),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    ButtonTheme(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                        ),
                        onPressed: () => print("wasda"),
                        child: Text("Hinzufügen"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
