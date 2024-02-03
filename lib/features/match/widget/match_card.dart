import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/core/utlis.dart';
import 'package:livescore/models/match.dart';
import 'package:livescore/theme/theme.dart';

class MatchCard extends ConsumerWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final match = ref.watch(matchListProvider);
    return match.when(
      data: (matches) {
        List<MatchModel> filterMatch =
            matches.where((match) => (match.status == 'IN_PLAY')).toList();
        filterMatch.sort((a, b) =>
            DateTime.parse(b.utcDate).compareTo(DateTime.parse(a.utcDate)));

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: filterMatch.map((matchData) {
            //crest hanlder
            Widget homeTeamCrest =
                UtilsExtension.buildCrestImage(matchData.homeTeam.crest);
            Widget awayTeamCrest =
                UtilsExtension.buildCrestImage(matchData.awayTeam.crest);

            //competition icon
            Widget competitionIcon =
                UtilsExtension.buildCrestImage(matchData.competition.emblem);

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              height: AppLayout.getHeight(250),
              width: AppLayout.getWidth(290),
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
                          height: AppLayout.getHeight(50),
                          width: AppLayout.getHeight(50),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: competitionIcon),
                        ),
                        NormalText(
                          text: matchData.status,
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
                                height: AppLayout.getHeight(63),
                                width: AppLayout.getHeight(63),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Pallete.whiteColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: homeTeamCrest,
                                )),
                            Gap(AppLayout.getWidth(10)),
                            NormalText(
                              text: matchData.homeTeam.shortName,
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
                                text: "${matchData.score.fullTime.home}",
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
                                text: '${matchData.score.fullTime.away}',
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
                                color: Pallete.whiteColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: awayTeamCrest,
                              ),
                            ),
                            Gap(AppLayout.getWidth(10)),
                            NormalText(
                              text: matchData.awayTeam.shortName,
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
            );
          }).toList()),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text("Error: $error"),
      ),
    );
  }
}
