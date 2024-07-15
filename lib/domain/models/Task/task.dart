class TaskModel {
  final int id;
  final String title, date;
  final int isCompleted;

  TaskModel(
      {required this.id,
      required this.title,
      required this.isCompleted,
      required this.date});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      isCompleted: json['is_completed'],
      date: json['due_date'],
    );
  }
}
