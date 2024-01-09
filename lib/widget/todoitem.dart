import 'package:flutter/material.dart';
import 'package:to_do_app/utils/colors.dart';
import 'package:to_do_app/utils/toDoDatas.dart';

class TodoItem extends StatelessWidget {
  final TodoData todoo;
  final onTodoChanged;
  final onDeleteItem;

  TodoItem(
      {Key? key, required this.todoo, this.onTodoChanged, this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          // print("tapped list tile");
          onTodoChanged(todoo);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titleAlignment: ListTileTitleAlignment.center,
        tileColor: Colors.white38,
        leading: Icon(
          todoo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.black45,
        ),
        title: Text(
          todoo.todotext!,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.black,
              decoration: todoo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: secndthemeClr, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            onPressed: () {
              // print("tapped delete icon");
              onDeleteItem(todoo.id);
            },
            icon: Icon(Icons.delete),
            color: Colors.white,
            iconSize: 18,
          ),
        ),
      ),
    );
  }
}
