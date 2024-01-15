class TodoData {
  String? id;
  String? todotext;
  bool isDone;

  TodoData({
    required this.id,
    required this.todotext,
    this.isDone = false,
  });
  static List<TodoData> todoList() {
    return [
      TodoData(id: "01", todotext: "data1", isDone: true),
      TodoData(id: "02", todotext: "data2"),
      TodoData(id: "03", todotext: "data3", isDone: true),
      TodoData(id: "04", todotext: "data4"),
      TodoData(id: "05", todotext: "data5"),
    ];
  }
}
