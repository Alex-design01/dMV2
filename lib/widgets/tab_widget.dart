import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  String name;

  TabWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.lightBlue),
        child: Center(
          child: Text(name),
        ),
      ),
    );
  }
}
