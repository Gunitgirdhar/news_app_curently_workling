import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trying_newsapp/Bloc/news_event.dart';
import 'package:trying_newsapp/Bloc/news_state.dart';

import '../Api_helper/api_helper.dart';

class NewsBloc extends Bloc<NewsEvent,NewsState>{
  ApiHelper apiHelper;
  NewsBloc({required this.apiHelper}) : super(NewsInitialState()){
    on<GetEverythingNews>((event,emit){
      emit(NewsLoadingState());
    });

  }
}