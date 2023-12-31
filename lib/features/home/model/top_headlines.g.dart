// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_headlines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopHeadLines _$TopHeadLinesFromJson(Map<String, dynamic> json) => TopHeadLines(
      totalArticles: json['totalArticles'] as int,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => Articles.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopHeadLinesToJson(TopHeadLines instance) =>
    <String, dynamic>{
      'articles': instance.articles,
      'totalArticles': instance.totalArticles,
    };

Articles _$ArticlesFromJson(Map<String, dynamic> json) => Articles(
      title: json['title'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      url: json['url'] as String,
      image: json['image'] as String,
      publishedAt: json['publishedAt'] as String,
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'url': instance.url,
      'image': instance.image,
      'publishedAt': instance.publishedAt,
      'source': instance.source,
    };

Source _$SourceFromJson(Map<String, dynamic> json) => Source(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
