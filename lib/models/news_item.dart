import 'package:meta/meta.dart';

class NewsItem {
  String sourceId;
  String sourceName;
  String author;
  String title;
  String description;
  String url;
  String imageUrl;
  String content;

  NewsItem(
    {
      @required  this.sourceId,
      @required this.sourceName,
      @required this.author,
      @required this.title,
      @required this.description,
      @required this.url,
      @required this.imageUrl,
      @required this.content,
    }
  );
}