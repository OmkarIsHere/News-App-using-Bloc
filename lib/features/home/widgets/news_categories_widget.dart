import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class NewsCategoryWidget extends StatelessWidget {
  final String categoryName;
  const NewsCategoryWidget({super.key, required this.categoryName, required this.homeBloc});
  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context){
    // return BlocConsumer(
    //   bloc: homeBloc,
    //   listener: (BuildContext context, Object? state) {  },
    //   builder: (BuildContext context, state) {
    //     if(state is HomeChangedCategoryNameState){
    //       print("In HomeChangedCategoryName: ${state.category}");
    //       return Semantics(
    //         button: true,
    //         enabled: true,
    //         child: InkWell(
    //           onTap: () {
    //             homeBloc.add(HomeFetchDataEvent(categoryName.toLowerCase()));
    //             homeBloc.add(HomeChangedCategoryNameEvent(categoryName));
    //           },
    //           child: Container(
    //               margin: const EdgeInsets.symmetric(horizontal: 3),
    //               padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
    //               decoration: BoxDecoration(
    //                 color: (state.category == categoryName) ? Colors.grey : Colors.transparent,
    //                 borderRadius: BorderRadius.circular(50),
    //                 border:Border.all(color: Colors.grey),
    //               ),
    //               child: Text(
    //                 categoryName,
    //                 style: TextStyle(
    //                     color: (state.category == categoryName) ? Colors.white : Colors.black,
    //                     fontFamily: 'OpenSans-Regular',
    //                     fontSize: 14),
    //               )),
    //         ),
    //       );
    //     }else{
    //       print("Not In HomeChangedCategoryName:");
    //       return Semantics(
    //         button: true,
    //         enabled: true,
    //         child: InkWell(
    //           onTap: () => homeBloc.add(HomeFetchDataEvent(categoryName.toLowerCase())),
    //           child: Container(
    //               margin: const EdgeInsets.symmetric(horizontal: 3),
    //               padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(50),
    //                 border:Border.all(color: Colors.grey), //(selectedCategory.c == categoryName) ?
    //               ),
    //               child: Text(
    //                 categoryName,
    //                 style:const TextStyle(
    //                     fontFamily: 'OpenSans-Regular',
    //                     fontSize: 14),
    //               )),
    //         ),
    //       );
    //     }
    //   },
    // );
    return Semantics(
      button: true,
      enabled: true,
      child: InkWell(
        onTap: () => homeBloc.add(HomeFetchDataEvent(categoryName.toLowerCase())),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border:Border.all(color: Colors.grey), //(selectedCategory.c == categoryName) ?
            ),
            child: Text(
              categoryName,
              style:const TextStyle(
                  fontFamily: 'OpenSans-Regular',
                  fontSize: 14),
            )),
      ),
    );
  }
}
