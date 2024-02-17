import 'package:bai_tap_4/helpers/dialog_helper.dart';
import 'package:bai_tap_4/models/todo_model.dart';
import 'package:bai_tap_4/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseService _firebaseService = FirebaseService();
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: _buildUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: _displayTextInputDialog,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: const Text(
        'Todo',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Column(
        children: [
          _messagesListView(),
        ],
      ),
    );
  }

  Widget _messagesListView() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
        stream: _firebaseService.getTodo(),
        builder: (context, snapshot) {
          List todos = snapshot.data?.docs ?? [];
          if (todos.isEmpty) {
            return const Center(
              child: Text('Add to todo!'),
            );
          }

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              TodoModel todoModel = todos[index].data();
              String todoId = todos[index].id;
              debugPrint("todo : $todoId");
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  tileColor: Theme.of(context).colorScheme.primaryContainer,
                  title: Text(todoModel.task),
                  subtitle: Text(
                    DateFormat("dd-MM-yyyy hh:mm a").format(
                      todoModel.updateOn.toDate(),
                    ),
                  ),
                  trailing: Checkbox(
                    value: todoModel.isDone,
                    onChanged: (value) {
                      TodoModel todoModelUpdate = todoModel.copyWith(
                        isDone: !todoModel.isDone,
                        updateOn: Timestamp.now(),
                      );
                      _firebaseService.updateTodo(todoId, todoModelUpdate);
                    },
                  ),
                  onTap: () {
                    _showDialogUpdate(todoId, todoModel);
                  },
                  onLongPress: () => showDialogDelete(
                    context,
                    todoModel.task,
                    () {
                      _firebaseService.deleteTodo(todoId);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Xóa thành công'),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showDialogUpdate(String todoId, TodoModel todoModel) async {
    _todoController.text = todoModel.task;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update a todo'),
          content: TextField(
            controller: _todoController,
            decoration: const InputDecoration(hintText: 'Task ... '),
          ),
          actions: [
            MaterialButton(
              color: Theme.of(context).colorScheme.primary,
              textColor: Colors.white,
              child: const Text('Oke'),
              onPressed: () {
                TodoModel todoModelUpdate = todoModel.copyWith(
                  task: _todoController.text,
                  updateOn: Timestamp.now(),
                );

                _firebaseService.updateTodo(todoId, todoModelUpdate);

                Navigator.pop(context);
                _todoController.clear();
              },
            )
          ],
        );
      },
    );
  }

  void _displayTextInputDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a todo'),
          content: TextField(
            controller: _todoController,
            decoration: const InputDecoration(hintText: 'Task ... '),
          ),
          actions: [
            MaterialButton(
              color: Theme.of(context).colorScheme.primary,
              textColor: Colors.white,
              child: const Text('Oke'),
              onPressed: () {
                TodoModel todoModel = TodoModel(
                  task: _todoController.text,
                  isDone: false,
                  createOn: Timestamp.now(),
                  updateOn: Timestamp.now(),
                );
                _firebaseService.addTodo(todoModel);
                Navigator.pop(context);
                _todoController.clear();
              },
            )
          ],
        );
      },
    );
  }
}
