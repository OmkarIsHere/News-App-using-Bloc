
import '../model/top_headlines.dart';

abstract class HomeState{}

abstract class HomeActionState extends HomeState{}

class HomeInitialState extends HomeState{}

class HomeLoadingState extends HomeState{}

class HomeDataLoadedState extends HomeState{
  final List<Articles> articles;
  HomeDataLoadedState(this.articles);
}

class HomeChangedCategoryNameState extends HomeState {
  final String category;
  HomeChangedCategoryNameState(this.category);
}

class HomeErrorState extends HomeState {}

class HomeRedirectToFullNewsState extends HomeActionState{}
