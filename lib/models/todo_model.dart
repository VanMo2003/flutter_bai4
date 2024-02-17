// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String task;
  bool isDone;
  Timestamp createOn;
  Timestamp updateOn;

  TodoModel({
    required this.task,
    required this.isDone,
    required this.createOn,
    required this.updateOn,
  });

  TodoModel.fromJson(Map<String, Object?> json)
      : this(
          task: json['task'] as String,
          isDone: json['isDone'] as bool,
          createOn: json['createOn'] as Timestamp,
          updateOn: json['updateOn'] as Timestamp,
        );
  TodoModel copyWith({
    String? task,
    bool? isDone,
    Timestamp? createOn,
    Timestamp? updateOn,
  }) {
    return TodoModel(
      task: task ?? this.task,
      isDone: isDone ?? this.isDone,
      createOn: createOn ?? this.createOn,
      updateOn: updateOn ?? this.updateOn,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'task': task,
      'isDone': isDone,
      'createOn': createOn,
      'updateOn': updateOn,
    };
  }
}
