import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_getx/main/controllers/todo_controller.dart';
import 'package:todo_getx/main/widgets/appbar.dart';
import 'package:todo_getx/main/widgets/textField.dart';
import 'package:todo_getx/main/widgets/todo_containers.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final c = Get.put(TodoController());
    return Scaffold(
      appBar: customAppBar,
      body: GetBuilder<TodoController>(
        init: TodoController(),
        builder: (c) {
          if (c.isloading.value) {
            c.fetchdata();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: c.allTodos.map((e) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          borderRadius: BorderRadius.circular(20),
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          onPressed: (context) {
                            c.delete(e.id);
                          },
                        ),
                      ],
                    ),
                    child: TodoContainer(
                      title: e.title,
                      id: e.id,
                      date: e.date,
                    ),
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.sizeOf(context).height / 3,
                  child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Add Todo",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFd(
                            controller: textController,
                            hintText: "Todo",
                            obscureText: false),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              c.addTodo(textController.text);
                              Navigator.pop(context);
                              textController.clear();
                            }, child: const Text("Add"))
                      ]),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
