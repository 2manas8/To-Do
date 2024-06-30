class Task {
  String id;
  String task;
  bool done;

  Task({
    required this.id,
    required this.task,
    required this.done
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['_id'],
      task: json['task'],
      done: json['done']
    );
  }
}