import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class NewsCategoryWidget extends StatelessWidget {
  final String categoryName;
  const NewsCategoryWidget({super.key, required this.categoryName, required this.homeBloc});
  final HomeBloc homeBloc; //= HomeBloc();
  @override
  Widget build(BuildContext context) {
    return  Semantics(
      button: true,
      enabled: true,
      child: InkWell(
        onTap: () => homeBloc.add(HomeFetchDataEvent(categoryName.toLowerCase())),
        child: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 3),
            padding: const EdgeInsets.symmetric(
                vertical: 3, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.grey),
            ),
            child: Text(
              categoryName,
              style:const TextStyle(color: Colors.black),
            )),
      ),
    );
  }
}
