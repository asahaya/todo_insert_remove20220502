import 'package:flutter/material.dart';
import 'package:todo_insert_remove20220502/list_item.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: buildItem(),
    );
  }

  Widget buildItem() {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.greenAccent,
          ),
          child: Text(item.label),
        ),
        title: Text(item.title),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
            size: 32,
          ),
          onPressed: onClicked,
        ),
      ),
    );
  }
}
