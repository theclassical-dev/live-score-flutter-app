import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:livescore/common/common.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/theme/theme.dart';

// ignore: must_be_immutable
class NewsSlideWidget extends StatelessWidget {
  final String image;
  final String author;
  final String company;
  final String title;
  String? description;
  String? date;
  String? time;
  NewsSlideWidget({
    super.key,
    required this.image,
    required this.author,
    required this.company,
    required this.title,
    this.description,
    this.date,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(5)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(5)),
        constraints: BoxConstraints(
            minWidth: AppLayout.getWidth(100),
            minHeight: AppLayout.getHeight(250),
            maxWidth: AppLayout.getWidth(300),
            maxHeight: AppLayout.getHeight(280)),
        padding: EdgeInsets.symmetric(
            vertical: AppLayout.getHeight(0),
            horizontal: AppLayout.getHeight(0)),
        decoration: BoxDecoration(
          color: Pallete.blueColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppLayout.getHeight(20)),
            topRight: Radius.circular(AppLayout.getHeight(20)),
            bottomLeft: Radius.circular(AppLayout.getHeight(5)),
            bottomRight: Radius.circular(AppLayout.getHeight(5)),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: AppLayout.getHeight(150),
            constraints: BoxConstraints(minWidth: AppLayout.getWidth(300)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppLayout.getHeight(10)),
                topRight: Radius.circular(AppLayout.getHeight(10)),
                bottomLeft: Radius.circular(AppLayout.getHeight(5)),
                bottomRight: Radius.circular(AppLayout.getHeight(5)),
              ),
              color: Pallete.whiteColor,
              image:
                  DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: AppLayout.getWidth(10),
                        bottom: AppLayout.getWidth(5)),
                    child: NormalText(
                      text: author,
                      fontSize: AppLayout.getHeight(10),
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: AppLayout.getWidth(10),
                        bottom: AppLayout.getWidth(5)),
                    child: NormalText(
                      text: company,
                      fontSize: AppLayout.getHeight(10),
                    ),
                  ),
                )
              ],
            ),
          ),
          Gap(AppLayout.getHeight(10)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
            child: HeadlineText(
              text: title,
              color: Pallete.whiteColor,
              fontsize: AppLayout.getHeight(12),
            ),
          ),
          description != ""
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(10),
                      vertical: AppLayout.getWidth(5)),
                  child: NormalText(
                    text: description ?? "",
                    fontSize: AppLayout.getHeight(9),
                  ),
                )
              : Container(),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: AppLayout.getWidth(10)),
            child: Column(
              children: [
                NormalText(
                  text: date ?? "",
                  fontSize: AppLayout.getHeight(7),
                ),
                NormalText(
                  text: time ?? "",
                  fontSize: AppLayout.getHeight(7),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
