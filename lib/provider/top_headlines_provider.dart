import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_retrofit/repository/my_home_page_repo.dart';


final topHeadlinesProvider = FutureProvider.family.autoDispose((ref, String category){
 final myHomePageRepo = MyHomePageRepo();
 return myHomePageRepo.fetchData(category);
});
