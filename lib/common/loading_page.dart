import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:livescore/core/app_layout.dart';
import 'package:livescore/theme/pallete.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 1.0),
          height: AppLayout.getHeight(90),
          constraints: BoxConstraints(minWidth: AppLayout.getWidth(190)),
          decoration: BoxDecoration(
            color: Pallete.greyLightColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.transparent),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: AppLayout.getWidth(10), right: AppLayout.getWidth(10)),
            child: Row(
              children: [
                Container(
                  height: AppLayout.getHeight(51),
                  width: AppLayout.getHeight(51),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white38,
                  ),
                ),
                Gap(AppLayout.getHeight(15)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: AppLayout.getHeight(30),
                      width: AppLayout.getWidth(200),
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius:
                              BorderRadius.circular(AppLayout.getWidth(10))),
                    ),
                    Gap(AppLayout.getHeight(5)),
                    Row(
                      children: [
                        Container(
                          height: AppLayout.getHeight(20),
                          width: AppLayout.getWidth(100),
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(
                                  AppLayout.getWidth(10))),
                        ),
                        Container(
                          height: AppLayout.getHeight(20),
                          width: AppLayout.getWidth(100),
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(
                                  AppLayout.getWidth(10))),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 6.0),
          height: AppLayout.getHeight(90),
          constraints: BoxConstraints(minWidth: AppLayout.getWidth(22)),
          decoration: BoxDecoration(
            color: Pallete.greyLightColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppLayout.getHeight(10)),
                bottomLeft: Radius.circular(AppLayout.getHeight(10))),
            border: Border.all(color: Colors.transparent),
          ),
        ),
      ],
    );
  }
}
