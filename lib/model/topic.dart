class Topic {
  final int id;
  final String title;
  final String description;
  // final String author;
  // final String urlImage;

  const Topic({
    required this.id,
    // required this.author,
    required this.title,
    required this.description,
    // required this.urlImage,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json['id'],
        // author: json['author'],
        title: json['title'],
        description: json['description'],
        // urlImage: json['urlImage'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description
        // 'author': author,
        // 'urlImage': urlImage,
      };
}
