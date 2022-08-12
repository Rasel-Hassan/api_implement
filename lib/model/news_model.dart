// class NewsApi {
//   late String status;
//   late int totalResults;
//   late List<Articles> articles;
// }

class Articles {
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  Articles(this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);


}

