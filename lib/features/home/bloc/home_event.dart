
abstract class HomeEvent{}

class HomeFetchDataEvent extends HomeEvent{
  final String category;
  HomeFetchDataEvent(this.category);
}

class HomeChangedCategoryNameEvent extends HomeEvent{
  final String category;
  HomeChangedCategoryNameEvent(this.category);
}

class HomeRedirectToFullNewsEvent extends HomeEvent{}
