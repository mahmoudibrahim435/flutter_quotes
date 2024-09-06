// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../main.dart';

class Mycards extends StatelessWidget {
  final Function deleteme;
  final BestQuotes item;
  const Mycards({
    super.key,
    required this.deleteme,
    required this.item,
    //  required this.index
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 57, 66, 151),
      margin: EdgeInsets.all(11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(item.title,
                style: TextStyle(fontSize: 26, color: Colors.white),
                textDirection: TextDirection.rtl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    deleteme(item);
                  },
                  icon: Icon(Icons.delete),
                  iconSize: 27,
                  color: Color.fromARGB(255, 255, 217, 217),
                ),
                Text(item.person,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textDirection: TextDirection.rtl),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
