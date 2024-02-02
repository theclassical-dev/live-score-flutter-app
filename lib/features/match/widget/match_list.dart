import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/app_layout.dart';
import 'package:livescore/theme/theme.dart';

class MatchList extends ConsumerWidget {
  const MatchList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        // margin: const EdgeInsets.symmetric(horizontal: 8.0),
        height: AppLayout.getHeight(80),
        // width: AppLayout.getWidth(300),
        constraints: BoxConstraints(minWidth: AppLayout.getWidth(200)),
        decoration: BoxDecoration(
          color: Color(0xFFFF6F6F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getHeight(15),
              vertical: AppLayout.getHeight(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  NormalText(
                    text: "Man City",
                    fontSize: AppLayout.getHeight(13),
                    color: Pallete.blueColor,
                  ),
                  Gap(AppLayout.getWidth(2)),
                  Container(
                    height: AppLayout.getHeight(40),
                    width: AppLayout.getHeight(40),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Gap(AppLayout.getWidth(2)),
              Column(
                children: [
                  NormalText(
                    text: "27 May 2024",
                    fontSize: AppLayout.getHeight(10),
                    color: Pallete.blueColor,
                  ),
                  NormalText(
                    text: "16:30",
                    fontSize: AppLayout.getHeight(10),
                    color: Pallete.blueColor,
                  ),
                ],
              ),
              Gap(AppLayout.getWidth(2)),
              Row(
                children: [
                  Container(
                    height: AppLayout.getHeight(40),
                    width: AppLayout.getHeight(40),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Gap(AppLayout.getWidth(2)),
                  NormalText(
                    text: "Chelsea Fc",
                    fontSize: AppLayout.getHeight(13),
                    color: Pallete.blueColor,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
