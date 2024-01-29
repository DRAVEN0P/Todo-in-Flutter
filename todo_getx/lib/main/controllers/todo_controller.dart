import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo_getx/main/constants/constants.dart';
import 'package:todo_getx/main/models/todo.dart';
import "package:http/http.dart" as http;

class TodoController extends GetxController {
  List<Todo> allTodos = [];
  var isloading = true.obs;

  void fetchdata() async {
    // print("hello");
    try {
      var response = await http.get(Uri.parse(api));
      var data = json.decode(response.body);
      data.forEach((todo) {
        Todo temp = Todo(
          id: todo['id'].toString(),
          title: todo['title'],
          date: todo['date'],
        );
        allTodos.add(temp);
      });
        isloading.value = false;
      // print(allTodos.length);
      update();
    } catch (e) {
      // print(e);
    }
  }

  void delete(String id) async {
    try {
      await http.delete(Uri.parse(api + id));
      allTodos = [];
      fetchdata();
    } catch (e) {
      // print(e);
    }
  }

  void addTodo(String todo) async {
    try {
      if (todo != "" ){}
      var response = await http.post(
        Uri.parse(api),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'title': todo,
        }),
      );
      if (response.statusCode == 201) {
        allTodos = [];
        fetchdata();
      }
    } catch (e) {
      print(e);
    }
  }
}
