
abstract class HomeEvent{}

class HomeFetchDataEvent extends HomeEvent{
  final String category;
  HomeFetchDataEvent(this.category);
}

class HomeChangeCategoryEvent extends HomeEvent{}

class HomeRedirectToFullNewsEvent extends HomeEvent{}
