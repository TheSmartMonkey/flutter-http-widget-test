class JsonPlaceholderModel {
  int id;
  int userId;
  String title;
  bool completed;

  JsonPlaceholderModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'title': title,
        'completed': completed,
      };

  JsonPlaceholderModel.fromJson(dynamic json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'],
        completed = json['completed'];
}
