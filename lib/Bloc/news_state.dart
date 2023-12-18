import '../Models/User_article.dart';

abstract class NewsState{}

class NewsInitialState extends NewsState{}
class NewsLoadingState extends NewsState{}
class NewsLoadedState extends NewsState{
   UserArticleModel newsModel;
   NewsLoadedState({required this.newsModel});
}
class NewsErrorState extends NewsState{
  String errorMsg;
  NewsErrorState({required this.errorMsg});
}
