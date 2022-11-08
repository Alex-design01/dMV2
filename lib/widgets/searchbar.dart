import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/tab_widget.dart';

class Searchbar extends StatelessWidget {
  final List<String> category;
  const Searchbar(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 110,
      scrollDirection: Axis.horizontal,
      itemCount: category.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 4.0, left: 4.0),
          child: TabWidget(category[index]),
        );
      },
    );
  }
}
