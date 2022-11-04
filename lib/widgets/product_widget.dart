import 'package:flutter/material.dart';

import '../objects/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? description = product.description ?? "";
    return ListTile(
      title: Text(product.name),
      subtitle: Text(description),
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            child: Center(
              child: SizedBox(
                  height: 80, child: BottomSheetDescription(product: product)),
            ),
          );
        },
      ),
    );
  }
}

class BottomSheetDescription extends StatefulWidget {
  final Product product;
  const BottomSheetDescription({Key? key, required this.product})
      : super(key: key);

  @override
  State<BottomSheetDescription> createState() => _BottomSheetDescriptionState();
}

int quantity = 0;

class _BottomSheetDescriptionState extends State<BottomSheetDescription> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        quantity++;
      }),
      child: Card(
        color: Colors.lightBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                widget.product.name,
                style: const TextStyle(fontSize: 21),
              ),
            ),
            Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.add_circle_outline,
                  ),
                  onTap: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
                Text(
                  quantity.toString(),
                  style: TextStyle(fontSize: 21),
                ),
                InkWell(
                  child: Icon(Icons.remove_circle_outline_sharp),
                  onTap: () {
                    setState(() {
                      if (quantity == 0) {
                        quantity = 0;
                      } else {
                        quantity--;
                      }
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
