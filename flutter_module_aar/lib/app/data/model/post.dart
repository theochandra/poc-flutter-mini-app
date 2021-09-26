class Post {
  final int id;
  final String title;
  final String body;

  const Post({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromDatabseJson(Map<String, dynamic> data) => Post(
        id: data['id'],
        title: data['title'],
        body: data['body'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        'id': this.id,
        'title': this.title,
        'body': this.body,
      };
}
