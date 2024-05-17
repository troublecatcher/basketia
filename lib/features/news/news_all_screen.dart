import 'package:auto_route/auto_route.dart';
import 'package:basketia/app/router/router.dart';
import 'package:basketia/features/news/news.dart';
import 'package:basketia/features/news/news_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';

@RoutePage()
class NewsAllScreen extends StatefulWidget {
  const NewsAllScreen({super.key});

  @override
  State<NewsAllScreen> createState() => _NewsAllScreenState();
}

class _NewsAllScreenState extends State<NewsAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All News',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.r),
        itemBuilder: (context, index) {
          News news;
          if (index <= 3) {
            news = News.breakingNews[index];
          } else {
            news = News.otherNews[index - News.breakingNews.length];
          }
          return NewsWidget(news: news);
        },
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: News.breakingNews.length + News.otherNews.length,
      ),
    );
  }
}
