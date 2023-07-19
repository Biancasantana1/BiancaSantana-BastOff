class Task {
  bool isDone;
  String task;
  String date;

  Task({
    required this.isDone,
    required this.task,
    required this.date,
  });

  Task.fromJson(Map<String, dynamic> json)
      : isDone = json['isDone'],
        task = json['task'],
        date = json['date'];

  Map<String, dynamic> toJson() => {
        'isDone': isDone,
        'task': task,
        'date': date,
      };
}
