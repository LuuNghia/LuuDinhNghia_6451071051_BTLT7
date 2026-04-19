class Post {
  final String title;
  final String body;

  Post({required this.title, required this.body});

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
      };
}