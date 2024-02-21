import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:livescore/common/common.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/theme/theme.dart';

class NewsSlideWidget extends StatelessWidget {
  final String image;
  final String author;
  final String company;
  final String title;
  final String description;
  const NewsSlideWidget(
      {super.key,
      required this.image,
      required this.author,
      required this.company,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(5)),
      constraints: BoxConstraints(
        minWidth: AppLayout.getWidth(200),
        minHeight: AppLayout.getHeight(250),
      ),
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(10),
          horizontal: AppLayout.getHeight(10)),
      decoration: BoxDecoration(
        color: Pallete.blueColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          height: AppLayout.getHeight(150),
          constraints: BoxConstraints(minWidth: AppLayout.getWidth(400)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Pallete.whiteColor,
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: AppLayout.getHeight(10),
                right: AppLayout.getHeight(10),
                child: NormalText(
                  text: author,
                  fontSize: AppLayout.getHeight(10),
                ),
              ),
              Positioned(
                bottom: AppLayout.getHeight(10),
                left: AppLayout.getHeight(10),
                child: NormalText(
                  text: company,
                  fontSize: AppLayout.getHeight(10),
                ),
              )
            ],
          ),
        ),
        Gap(AppLayout.getHeight(5)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
          child: HeadlineText(
            text: title,
            color: Pallete.whiteColor,
            fontsize: AppLayout.getHeight(13),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(10),
              vertical: AppLayout.getWidth(5)),
          child: NormalText(
            text: description,
            fontSize: AppLayout.getHeight(9),
          ),
        ),
      ]),
    );
  }
}
