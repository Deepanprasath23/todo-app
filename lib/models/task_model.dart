class Task {
  final String title;
  final String description;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'isCompleted': isCompleted,
      };
}
