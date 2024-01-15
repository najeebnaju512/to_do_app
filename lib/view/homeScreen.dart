import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/view/profile.dart';
import '../utils/colors.dart';
import '../model/toDoDatas.dart';
import '../widget/todoitem.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoslist = TodoData.todoList();
  List<TodoData> _fountTodo = [];
  final _todocController = TextEditingController();

  @override
  void initState() {
    _fountTodo = todoslist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primethemeClr,
      appBar: _buildAppbar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Searchbox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "All ToDo's",
                          style: GoogleFonts.whisper(
                              letterSpacing: 2,
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: secndthemeClr),
                        ),
                      ),
                      for (TodoData todoData in _fountTodo.reversed)
                        TodoItem(
                          todoo: todoData,
                          onTodoChanged: _handleTodoChange,
                          onDeleteItem: _deleteTodoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 10,
                        )
                      ]),
                  child: TextField(
                    controller: _todocController,
                    decoration: InputDecoration(
                        hintText: "Add New Todo Item",
                        border: InputBorder.none),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_todocController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Add any Todo Item"),
                            backgroundColor: Colors.red[400],));
                      } else {
                        _addTodoItem(_todocController.text);
                      }
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: appbrthemeClr,
                        // minimumSize: Size(60, 60),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleTodoChange(TodoData todoData) {
    setState(() {
      todoData.isDone = !todoData.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoslist.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String todo) {
    setState(() {
      // if (todo==null) {
      //   SnackBar(content: Text("Add Todo Item"));
      // } else {
      todoslist.add(TodoData(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todotext: todo));
      // }
    });
    _todocController.clear();
  }

  void _runfilter(String enteredKeyword) {
    List<TodoData> results = [];

    if (enteredKeyword.isEmpty) {
      results = todoslist;
    } else {
      results = todoslist
          .where((item) => item.todotext!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _fountTodo = results;
    });
  }

  Widget Searchbox() {
    return Container(
      padding: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runfilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search, color: Colors.black38),
            hintText: "Search",
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black38)),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          size: 30,
        ),
      ),
      title: Text("ToDo"),
      actions: [
        CircleAvatar(
          child: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
              icon: Icon(Icons.person)),
        ),
        SizedBox(
          width: 10,
        )
      ],
      titleTextStyle: GoogleFonts.pacifico(
          fontSize: 30, fontWeight: FontWeight.w500, color: thirdthemeClr),
      backgroundColor: appbrthemeClr,
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
    );
  }
}
