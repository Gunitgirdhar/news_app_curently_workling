import 'Single_Article.dart';

class UserArticleModel{
  int? totalResults;
  String? status;
  List<ArticleModel>? articles;

UserArticleModel({this.status,this.totalResults,this.articles});

  factory UserArticleModel.fromJson(Map<String,dynamic> json){

    List<ArticleModel> marticle=[];
    for(Map<String,dynamic> melement in json['articles']){
      ArticleModel articlemodel=ArticleModel.fromJson(melement);
      marticle.add(articlemodel);
    }

    return UserArticleModel(
      articles: marticle,
      status: json['status'],
      totalResults: json['totalResults']
    );
  }
}



