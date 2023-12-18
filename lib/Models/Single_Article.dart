import 'package:trying_newsapp/Models/SouceModel.dart';

class ArticleModel{
  String? author;
  String? title;
  String? content;
  String? description;
  String? publishedAt;
  String? urlToImage;
  String? url;
  SourceModel? source;

  ArticleModel({this.title,this.author,this.description,this.content,this.publishedAt,this.source,this.url,this.urlToImage});


  factory ArticleModel.fromJson(Map<String,dynamic> json){
    return ArticleModel(
      title: json['title'],
      author: json['author'],
      content: json['content'],
      description: json['description'],
      publishedAt: json['publishedAt'],
      urlToImage: json['urlToImage'],
      url: json['url'],
      source: SourceModel.fromJson(json['source']),


    );
  }
}