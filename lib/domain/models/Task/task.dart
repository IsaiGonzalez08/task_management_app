class TaskModel {
  final int id;
  final String title, date;
  final int isCompleted;
  final String? createDate, updateDate, tags, description, comments;

  TaskModel(
      {required this.id,
      required this.title,
      required this.isCompleted,
      required this.date,
      this.comments,
      this.description,
      this.tags,
      this.createDate,
      this.updateDate});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      isCompleted: json['is_completed'],
      date: json['due_date'],
      comments: json['comments'] ?? '',
      description: json['description'] ?? '',
      tags: json['tags'] ?? '',
      createDate: _formatDate(json['created_at']),
      updateDate: _formatDate(json['updated_at']),
    );
  }

  static String _formatDate(String? dateTime) {
    if (dateTime == null) {
      return '';
    }
    DateTime parsedDate = DateTime.parse(dateTime);
    return "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}";
  }
}
