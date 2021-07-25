import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe To Delete',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final List<String> items = List<String>.generate(30, (i) => "Items ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe To Delete"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, int index) {
          final item = items[index];
          return Dismissible(
            key: Key(items[index]),
            onDismissed: (direction) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("Item Dismissed")));
            },
            background: Container(
              color: Colors.red,
            ),
            child: ListTile(
              title: Text("${items[index]}"),
            ),
          );
        },
      ),
    );
  }
}
