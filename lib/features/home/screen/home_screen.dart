
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_retrofit/features/home/bloc/home_bloc.dart';
import 'package:practice_retrofit/features/home/bloc/home_event.dart';
import 'package:practice_retrofit/features/home/bloc/home_state.dart';
import 'package:practice_retrofit/features/home/widgets/home_screen_loader.dart';
import '../widgets/news_categories_widget.dart';
import 'news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final homeBloc = HomeBloc();
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeFetchDataEvent('general'));
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Newzz',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Helvetica-Bold'),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 7),
                children: [
                  NewsCategoryWidget(categoryName: 'General', homeBloc: homeBloc),
                  NewsCategoryWidget(categoryName: 'World', homeBloc: homeBloc),
                  NewsCategoryWidget(categoryName: 'Nation', homeBloc: homeBloc),
                  NewsCategoryWidget(categoryName: 'Business', homeBloc: homeBloc),
                  NewsCategoryWidget(categoryName: 'Entertainment', homeBloc: homeBloc),
                  NewsCategoryWidget(categoryName: 'Science', homeBloc: homeBloc),
                  NewsCategoryWidget(categoryName: 'Sports', homeBloc: homeBloc),
                  NewsCategoryWidget(categoryName: 'Technology', homeBloc: homeBloc),
                  NewsCategoryWidget(categoryName: 'Health', homeBloc: homeBloc),
                ],
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
            bloc: homeBloc,
            builder: (context, homeState) {
                if(homeState is HomeLoadingState){
                  return HomeScreenLoader(size: mediaQuery);//const Center(child: CupertinoActivityIndicator());
                }
                else if(homeState is HomeErrorState){
                  return const Center(child: Text('Something went wrong'));
                }
                else if(homeState is HomeDataLoadedState){
                    final data = homeState;
                    return Expanded(
                        child: ListView.builder(
                            itemCount: data.articles.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => NewsScreen(article: data.articles[index])));
                                },
                                child: ListTile(
                                  leading: SizedBox(
                                    height: 120,
                                    width: 40,
                                    child: Image.network(
                                      data.articles[index].image,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return const Center(
                                          child: CupertinoActivityIndicator(),
                                        );
                                      },
                                    ),
                                  ),
                                  title: Text(
                                    data.articles[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontFamily: 'OpenSans-Bold'),
                                  ),
                                  subtitle: Text(
                                    data.articles[index].description,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'OpenSans-Regular',
                                    ),
                                  ),
                                ),
                              );
                            }),
                    );
                  }
                else {
                  return const SizedBox();
                }
              }
          ),
          ]
        ),
    );
  }
}
