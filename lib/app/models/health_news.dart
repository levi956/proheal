class HealthNews {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;

  String get newsAuthor => author ?? '';
  String get newsDesctiption => description ?? '';

  HealthNews(
      {this.author, this.description, this.title, this.url, this.urlToImage});

  factory HealthNews.fromJson(Map<String, dynamic> json) {
    return HealthNews(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      author: json['author'],
    );
  }
}
