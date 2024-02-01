import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/theme/theme.dart';

class MatchCard extends ConsumerWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            height: AppLayout.getHeight(180),
            width: AppLayout.getWidth(300),
            constraints: BoxConstraints(minWidth: AppLayout.getWidth(200)),
            decoration: BoxDecoration(
              color: Pallete.greyColor2,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getHeight(15),
                  vertical: AppLayout.getHeight(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: AppLayout.getHeight(40),
                          width: AppLayout.getHeight(40),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white38,
                          )),
                      NormalText(
                        text: "IN-PLAY",
                        fontSize: AppLayout.getHeight(10),
                        color: Pallete.blueColor,
                      )
                    ],
                  ),
                  Gap(AppLayout.getWidth(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                              height: AppLayout.getHeight(58),
                              width: AppLayout.getHeight(58),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white38,
                              )),
                          Gap(AppLayout.getWidth(10)),
                          NormalText(
                            text: "Arsenal",
                            fontSize: AppLayout.getHeight(15),
                            color: Pallete.blueColor,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          children: [
                            NormalText(
                              text: '0',
                              fontSize: AppLayout.getHeight(25),
                              color: Pallete.blueColor,
                            ),
                            Gap(AppLayout.getWidth(10)),
                            Container(
                                height: AppLayout.getHeight(6),
                                width: AppLayout.getHeight(20),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Pallete.blueColor,
                                )),
                            Gap(AppLayout.getWidth(10)),
                            NormalText(
                              text: '0',
                              fontSize: AppLayout.getHeight(25),
                              color: Pallete.blueColor,
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              height: AppLayout.getHeight(58),
                              width: AppLayout.getHeight(58),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white38,
                              )),
                          Gap(AppLayout.getWidth(10)),
                          NormalText(
                            text: "Arsenal",
                            fontSize: AppLayout.getHeight(15),
                            color: Pallete.blueColor,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            height: AppLayout.getHeight(180),
            width: AppLayout.getWidth(300),
            constraints: BoxConstraints(minWidth: AppLayout.getWidth(200)),
            decoration: BoxDecoration(
              color: Pallete.greyColor2,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getHeight(15),
                  vertical: AppLayout.getHeight(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: AppLayout.getHeight(40),
                          width: AppLayout.getHeight(40),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white38,
                          )),
                      NormalText(
                        text: "IN-PLAY",
                        fontSize: AppLayout.getHeight(10),
                        color: Pallete.blueColor,
                      )
                    ],
                  ),
                  Gap(AppLayout.getWidth(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                              height: AppLayout.getHeight(58),
                              width: AppLayout.getHeight(58),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white38,
                              )),
                          Gap(AppLayout.getWidth(10)),
                          NormalText(
                            text: "Arsenal",
                            fontSize: AppLayout.getHeight(15),
                            color: Pallete.blueColor,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          children: [
                            NormalText(
                              text: '0',
                              fontSize: AppLayout.getHeight(25),
                              color: Pallete.blueColor,
                            ),
                            Gap(AppLayout.getWidth(10)),
                            Container(
                                height: AppLayout.getHeight(6),
                                width: AppLayout.getHeight(20),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Pallete.blueColor,
                                )),
                            Gap(AppLayout.getWidth(10)),
                            NormalText(
                              text: '0',
                              fontSize: AppLayout.getHeight(25),
                              color: Pallete.blueColor,
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              height: AppLayout.getHeight(58),
                              width: AppLayout.getHeight(58),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white38,
                              )),
                          Gap(AppLayout.getWidth(10)),
                          NormalText(
                            text: "Arsenal",
                            fontSize: AppLayout.getHeight(15),
                            color: Pallete.blueColor,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
