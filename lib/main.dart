// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_pro3/cards/cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}
// class for quote (card)
class BestQuotes {
  String title;
  String person;
  BestQuotes({required this.person, required this.title});
}

class _QuotesState extends State<Quotes> {
  // list of all quotes
  List AllQuotes = [
    BestQuotes(
        person: "Ali Elrayek",
        title: "كُتر التفكير فى الى ضااااع هيعمل لك فى دماغك صادااااع  😉 "),
    BestQuotes(
        person: "ELRAYEK",
        title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
  ];
// function for delete any cards
  delete(BestQuotes item) {
    setState(() {
      AllQuotes.remove(item);
    });
  }
// function for add cards
  addnewquote() {
    setState(() {
      AllQuotes.add(  BestQuotes(
        person:myController2.text ,
        title:myController.text),);
    });
  }
// to give the quotes's text and author by creating 2 Controller
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: myController,
                      decoration: InputDecoration(hintText: 'Add new Quote'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: myController2,
                        decoration: InputDecoration(hintText: 'author')),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.blue,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            addnewquote();
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              // backgroundColor: Colors.blue
                            ),
                          )),
                    )
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          "Best Quotes",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              // map of all properties of cards.dart
            ...AllQuotes.map((item) => Mycards(
                //  give delete function from cards.dart
                  deleteme: delete,
                //  give item (cards properties) function from cards.dart
                  item: item,
                ))
          ],
        ),
      ),
    );
  }
}
