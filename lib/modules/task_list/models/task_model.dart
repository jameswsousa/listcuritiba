class TaskModel {
  final String title;
  final String? description;
  final DateTime createdAt;
  final bool done;
  final String id;

  TaskModel(
      {required this.title,
      required this.id,
      this.description,
      required this.createdAt,
      required this.done});

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      done: map['done'],
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
}
