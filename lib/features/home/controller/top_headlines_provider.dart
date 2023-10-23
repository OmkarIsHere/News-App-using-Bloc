import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/repositories/home_repo.dart';


final topHeadlinesProvider = FutureProvider.family.autoDispose((ref, String category){
 final homeRepo = HomeRepo();
 return homeRepo.fetchData(category);
});
