import 'package:flutter/material.dart';
import 'package:todo_insert_remove20220502/list_item.dart';
import 'package:todo_insert_remove20220502/list_item_widget.dart';
import 'package:todo_insert_remove20220502/list_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final listKey = GlobalKey<AnimatedListState>();
  final List<ListItem> star = List.from(psy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.orange,
        child: AnimatedList(
          key: listKey,
          initialItemCount: star.length,
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) =>
              ListItemWidget(
                item: star[index],
                animation: animation,
                onClicked: () {
                  removeItem(index);
                },
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: insertItem,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void insertItem() {
    final newIndex = star.length;
    final newItem = ListItem(title: 'ADD', label: 'XXX');

    star.insert(newIndex, newItem);
    listKey.currentState!.insertItem(
      newIndex,
      duration: Duration(milliseconds: 3000),
    );
  }

  void removeItem(int index) {
    final remoceItem = star[index];

    star.removeAt(index);
    listKey.currentState!.removeItem(
      index,
          (context, animation) =>
          ListItemWidget(
            item: remoceItem,
            animation: animation,
            onClicked: () {},
          ),
      duration: Duration(milliseconds: 2000),
    );
  }


}
