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
  List<TodoData> _foundTodo = [];
  final _todocController = TextEditingController();

  @override
  void initState() {
    _foundTodo = todoslist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primethemeClr,
      appBar: _buildAppbar(),
      drawer: drawer(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [_Searchbox(), _Listbody()],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: _tododataEnterFeild()),
                Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    child: addIcon())
              ],
            ),
          )
        ],
      ),
    );
  }

  Drawer drawer() {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 10,
      // width: MediaQuery.sizeOf(context).width ,
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      child: ListView(
        children: [
          DrawerHeader(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                            2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Hi UserName",
                  style: GoogleFonts.pacifico(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: thirdthemeClr),
                ),
                // Text("email*****@gmail.com",
                //     style: GoogleFonts.lora(
                //         fontSize: 12,
                //         fontWeight: FontWeight.w700,
                //         color: secndthemeClr)),
              ],
            ),
          )),
          buildListTile(Icons.privacy_tip_outlined, "Privacy"),
          buildListTile(Icons.help_outline, "Help&Support"),
          buildListTile(Icons.settings, "Settings"),
          buildListTile(Icons.share, "Share"),
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
      todoslist.add(TodoData(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todotext: todo));
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
      _foundTodo = results;
    });
  }

  Widget _Searchbox() {
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

  Widget _tododataEnterFeild() {
    return Container(
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
            hintText: "Add New Todo Item", border: InputBorder.none),
      ),
    );
  }

  Widget addIcon() {
    return ElevatedButton(
      onPressed: () {
        if (_todocController.text == "") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Add any Todo Item"),
            backgroundColor: Colors.red[400],
          ));
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  Widget _Listbody() {
    return Expanded(
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
          for (TodoData todoData in _foundTodo.reversed)
            TodoItem(
              todoo: todoData,
              onTodoChanged: _handleTodoChange,
              onDeleteItem: _deleteTodoItem,
            ),
        ],
      ),
    );
  }

  buildListTile(IconData iconname, String title) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          titleAlignment: ListTileTitleAlignment.center,
          tileColor: Colors.white38,
          leading: Icon(iconname, size: 15),
          title: Text(
            title,
            style: GoogleFonts.robotoSlab(
                fontSize: 15, fontWeight: FontWeight.w400),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        SizedBox(height: 5,)
      ],
    );
  }
}
