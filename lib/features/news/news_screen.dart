import 'package:auto_route/auto_route.dart';
import 'package:basketia/app/router/router.dart';
import 'package:basketia/features/news/news.dart';
import 'package:basketia/features/news/news_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'Breaking news',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 200.h,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.92),
                onPageChanged: (value) => setState(() => page = value),
                itemCount: News.breakingNews.length,
                itemBuilder: (context, index) {
                  final news = News.breakingNews[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () =>
                          context.router.push(NewsSingleRoute(news: news)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(
                            image: NetworkImage(news.imgLink),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(0, 0, 0, 0),
                                Color.fromRGBO(0, 0, 0, 0.95),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  news.title,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  '${Jiffy.parseFromDateTime(news.dateTime).fromNow()} • ${news.minRead} min read',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 18.h),
            SizedBox(
              height: 8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    width: 8.r,
                    height: 8.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: page == index
                          ? Theme.of(context).primaryColor
                          : Colors.white.withOpacity(0.3),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 8.w),
                  itemCount: News.breakingNews.length,
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Last news',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Text(
                          'View All',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        onPressed: () =>
                            context.router.push(const NewsAllRoute()),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final news = News.otherNews[index];
                      return NewsWidget(news: news);
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount: News.otherNews.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
