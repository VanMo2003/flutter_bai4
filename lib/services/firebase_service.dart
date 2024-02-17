import 'package:bai_tap_4/models/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String TODO_COLLECTION_REF = 'todos';

class FirebaseService {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _todoRef;
  FirebaseService() {
    _todoRef = _firestore
        .collection(TODO_COLLECTION_REF)
        .withConverter<TodoModel>(
          fromFirestore: (snapshot, _) => TodoModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  Stream<QuerySnapshot> getTodo() {
    return _todoRef.snapshots();
  }

  void addTodo(TodoModel todoModel) {
    _todoRef.add(todoModel);
  }

  void updateTodo(String todoId, TodoModel todoModel) {
    _todoRef.doc(todoId).update(todoModel.toJson());
  }

  void deleteTodo(String todoId) {
    _todoRef.doc(todoId).delete();
  }
}
