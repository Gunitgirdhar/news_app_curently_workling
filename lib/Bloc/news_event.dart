abstract class NewsEvent{}

class GetSearchNews extends NewsEvent{
  String query;
  GetSearchNews({required this.query});
}

class GetEverythingNews extends NewsEvent{}