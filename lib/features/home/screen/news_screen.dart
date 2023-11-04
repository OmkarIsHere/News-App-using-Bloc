import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/top_headlines.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 10,
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   onPressed: () => Navigator.pop(context),
        //   icon:const Icon(Icons.arrow_back, color: Colors.white, size: 26),
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 15),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  article.image,
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
              const SizedBox(height: 3),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Source : ${article.source.name}',
                  textAlign: TextAlign.start,
                  style:const TextStyle(
                      color: Colors.grey,
                      fontSize: 14),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                article.title,
                style:const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Text(
                '\t\t\t\t\t${article.description}.',
                overflow: TextOverflow.clip,
                style:const TextStyle(
                    fontSize: 16),
              ),
              const SizedBox(height: 6),
              Text(
                '\t\t\t\t\t${article.content}.',
                style:const TextStyle(
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
