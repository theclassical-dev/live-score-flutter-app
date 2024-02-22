import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:livescore/common/widgets/news_slide_widget.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/models/articles.dart';
import 'package:livescore/theme/pallete.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MatchNews extends ConsumerWidget {
  const MatchNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final article = ref.watch(articleListProvider);
    final controller = PageController();

    return article.when(
      data: (news) {
        List<Article> filteredNews = news.take(10).toList();

        filteredNews.sort((a, b) => DateTime.parse(b.publishedAt)
            .compareTo(DateTime.parse(a.publishedAt)));
        return SizedBox(
          height: AppLayout.getHeight(260),
          child: Column(
            children: [
              Center(
                  child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Pallete.blueColor,
                    dotHeight: AppLayout.getHeight(8),
                    dotWidth: AppLayout.getWidth(8)),
              )),
              Gap(AppLayout.getHeight(8)),
              Expanded(
                child: PageView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  children: filteredNews.map((article) {
                    // date handler
                    Map<String, String> formattedDate =
                        UtilsExtension.formatDate(article.publishedAt);

                    return NewsSlideWidget(
                      image: article.urlToImage,
                      author: article.author,
                      company: article.source.name,
                      title: article.title,
                      description: '',
                      date: formattedDate['date'],
                      time: formattedDate['time'],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text("Error: $error"),
      ),
    );
  }
}
