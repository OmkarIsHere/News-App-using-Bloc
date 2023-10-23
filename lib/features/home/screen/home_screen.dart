
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../full_news/screen/news_screen.dart';
import '../controller/top_headlines_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String category = 'general';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Top Headlines',
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
                  InkResponse(
                    onTap: () => setState(() => category = 'general'),
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: (category == 'general') ?Colors.grey :Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          'All',
                          style: TextStyle(color:(category == 'general')?Colors.white :Colors.black),
                        )),
                  ),
                  InkResponse(
                    onTap: () => setState(() => category = 'world'),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                        decoration: BoxDecoration(
                          color: (category == 'world') ?Colors.grey :Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          'World',
                          style: TextStyle(color:(category == 'world')?Colors.white :Colors.black),
                        )),
                  ),
                  InkResponse(
                    onTap: () => setState(() => category = 'nation'),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                        decoration: BoxDecoration(
                          color: (category == 'nation') ?Colors.grey :Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          'Nation',
                          style: TextStyle(color:(category == 'nation')?Colors.white :Colors.black),
                        )),
                  ),
                  InkResponse(
                    onTap: () => setState(() => category = 'business'),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                        decoration: BoxDecoration(
                          color: (category == 'business') ?Colors.grey :Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          'Business',
                          style: TextStyle(color:(category == 'business')?Colors.white :Colors.black),
                        )),
                  ),
                  InkResponse(
                    onTap: () =>setState(() => category = 'technology'),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                        decoration: BoxDecoration(
                          color: (category == 'technology') ?Colors.grey :Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                        ),
                        child:  Text(
                          'Technology',
                          style: TextStyle(color:(category == 'technology')?Colors.white :Colors.black),
                        )),
                  ),
                  InkResponse(
                    onTap: () =>setState(() => category = 'entertainment'),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                        decoration: BoxDecoration(
                          color: (category == 'entertainment') ?Colors.grey :Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          'Entertainment',
                          style: TextStyle(color:(category == 'entertainment')?Colors.white :Colors.black),
                        )),
                  ),
                  InkResponse(
                    onTap: () =>setState(() => category = 'sports'),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                        decoration: BoxDecoration(
                          color: (category == 'sports') ?Colors.grey :Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          'Sports',
                          style: TextStyle(color:(category == 'sports')?Colors.white :Colors.black),
                        )),
                  ),
                  InkResponse(
                    onTap: () =>setState(() => category = 'science'),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                        decoration: BoxDecoration(
                          color: (category == 'science') ?Colors.grey :Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          'Science',
                          style: TextStyle(color:(category == 'science')?Colors.white :Colors.black),
                        )),
                  ),
                  InkResponse(
                    onTap: () => setState(() => category = 'health'),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 15),
                        decoration: BoxDecoration(
                          color: (category == 'health') ?Colors.grey :Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          'Health',
                          style: TextStyle(color:(category == 'health')?Colors.white :Colors.black),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ref.watch(topHeadlinesProvider(category)).when(
                data: (data) {
                  return ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context)=> NewsScreen(article: data[index])));
                          },
                          child: ListTile(
                            leading: SizedBox(
                              height: 120,
                              width: 40,
                              child: Image.network(
                                data[index].image,
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
                              data[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'OpenSans-Bold'),
                            ),
                            subtitle: Text(
                              data[index].description,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'OpenSans-Regular'),
                            ),
                          ),
                        );
                      });
                },
                error: (error, stackTrace) {
                  print('error $stackTrace');
                  return Center(child: Text('$error'));
                },
                loading: () {
                  return const Center(child: CupertinoActivityIndicator());
                },
              ),
            )
          ],
        ));
  }
}