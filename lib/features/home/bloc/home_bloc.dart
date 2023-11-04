import 'package:bloc/bloc.dart';
import 'package:practice_retrofit/features/home/model/top_headlines.dart';

import '../../../data/repositories/home_repo.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc(): super(HomeInitialState()){
    final homeRepo = HomeRepo();

    on<HomeFetchDataEvent>((event, emit)async{
     emit(HomeLoadingState());
     List<Articles> articles = await homeRepo.fetchData(event.category);
     emit(HomeDataLoadedState(articles));
    });

    on<HomeRedirectToFullNewsEvent>((event, emit)=> emit(HomeRedirectToFullNewsState()));
  }

}