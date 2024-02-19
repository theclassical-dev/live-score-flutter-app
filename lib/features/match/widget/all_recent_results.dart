import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/models/match.dart';
import 'package:livescore/theme/theme.dart';

class AllRecentResult extends ConsumerWidget {
  const AllRecentResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentPlayedMatch = ref.watch(recentPlayedMatchListProvider);

    return recentPlayedMatch.when(
      data: (matches) {
        List<MatchModel> filterMatch = matches
            .where((match) =>
                (competitionsCodeOrder.contains(match.competition.code)))
            // .take(6)
            .toList();

        // List<MatchModel> filterMatch = matches
        // .where((match) => (match.status == 'FINISHED' &&
        //     competitionsCodeOrder.contains(match.competition.code)))
        // .toList();

        filterMatch.sort((a, b) =>
            DateTime.parse(b.utcDate).compareTo(DateTime.parse(a.utcDate)));

        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(15),
              vertical: AppLayout.getHeight(15)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppLayout.getHeight(20)),
              topRight: Radius.circular(AppLayout.getHeight(20)),
            ),
            color: Pallete.backgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: AppLayout.getHeight(5),
                width: AppLayout.getWidth(90),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                        BorderRadius.circular(AppLayout.getHeight(20))),
              ),
              Gap(AppLayout.getHeight(20)),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                      itemCount: filterMatch.length,
                      itemBuilder: (context, index) {
                        MatchModel matchData = filterMatch[index];

                        //crest hanlder
                        Widget homeTeamCrest = UtilsExtension.buildCrestImage(
                            matchData.homeTeam.crest);
                        Widget awayTeamCrest = UtilsExtension.buildCrestImage(
                            matchData.awayTeam.crest);

                        Map<String, String> formattedDate =
                            UtilsExtension.formatDate(matchData.utcDate);
                        return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: AppLayout.getHeight(5)),
                            height: AppLayout.getHeight(120),
                            // width: AppLayout.getWidth(300),
                            constraints: BoxConstraints(
                                minWidth: AppLayout.getWidth(200)),
                            decoration: BoxDecoration(
                              color: const Color(0xFFf6f6f6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppLayout.getHeight(15),
                                  vertical: AppLayout.getHeight(20)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  NormalText(
                                    text: matchData.status,
                                    fontSize: AppLayout.getHeight(6),
                                    color: Pallete.blueColor,
                                  ),
                                  NormalText(
                                    text: "${formattedDate['date']}",
                                    fontSize: AppLayout.getHeight(10),
                                    color: Pallete.blueColor,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                            minWidth: AppLayout.getWidth(100)),
                                        // height: AppLayout.getHeight(120),
                                        child: Row(
                                          children: [
                                            NormalText(
                                              text:
                                                  matchData.homeTeam.shortName,
                                              fontSize: AppLayout.getHeight(10),
                                              color: Pallete.blueColor,
                                            ),
                                            Gap(AppLayout.getWidth(2)),
                                            Container(
                                              height: AppLayout.getHeight(30),
                                              width: AppLayout.getHeight(30),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: homeTeamCrest),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        constraints: BoxConstraints(
                                            minWidth: AppLayout.getWidth(70)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            NormalText(
                                              text:
                                                  "${matchData.score.fullTime.home}",
                                              fontSize: AppLayout.getHeight(18),
                                              color: Pallete.blueColor,
                                            ),
                                            Gap(AppLayout.getWidth(5)),
                                            Container(
                                                height: AppLayout.getHeight(3),
                                                width: AppLayout.getHeight(10),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: Pallete.blueColor,
                                                )),
                                            Gap(AppLayout.getWidth(5)),
                                            NormalText(
                                              text:
                                                  "${matchData.score.fullTime.away}",
                                              fontSize: AppLayout.getHeight(18),
                                              color: Pallete.blueColor,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        constraints: BoxConstraints(
                                            minWidth: AppLayout.getWidth(100)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: AppLayout.getHeight(30),
                                              width: AppLayout.getHeight(30),
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: awayTeamCrest),
                                            ),
                                            Gap(AppLayout.getWidth(2)),
                                            NormalText(
                                              text:
                                                  matchData.awayTeam.shortName,
                                              fontSize: AppLayout.getHeight(10),
                                              color: Pallete.blueColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(AppLayout.getHeight(5)),
                                  NormalText(
                                    text: matchData.competition.name ==
                                            "Primera Division"
                                        ? "La liga"
                                        : matchData.competition.name,
                                    fontSize: AppLayout.getHeight(10),
                                    color: Pallete.redColor,
                                  ),
                                ],
                              ),
                            ));
                      })),
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
