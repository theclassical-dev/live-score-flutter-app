import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/core/utlis.dart';
import 'package:livescore/models/match.dart';
import 'package:livescore/theme/theme.dart';

class RecentResultList extends ConsumerWidget {
  const RecentResultList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final match = ref.watch(matchListProvider);
    return match.when(
      data: (matches) {
        List<MatchModel> filterMatch =
            matches.where((match) => (match.status == 'FINISHED')).toList();
        filterMatch.sort((a, b) =>
            DateTime.parse(b.utcDate).compareTo(DateTime.parse(a.utcDate)));

        return SizedBox(
            height: AppLayout.getHeight(300),
            child: ListView.builder(
                itemCount: filterMatch.length,
                itemBuilder: (context, index) {
                  MatchModel matchData = filterMatch[index];

                  //crest hanlder
                  Widget homeTeamCrest =
                      UtilsExtension.buildCrestImage(matchData.homeTeam.crest);
                  Widget awayTeamCrest =
                      UtilsExtension.buildCrestImage(matchData.awayTeam.crest);

                  return Container(
                      margin: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(5)),
                      height: AppLayout.getHeight(90),
                      // width: AppLayout.getWidth(300),
                      constraints:
                          BoxConstraints(minWidth: AppLayout.getWidth(200)),
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6F6F6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppLayout.getHeight(15),
                            vertical: AppLayout.getHeight(15)),
                        child: Column(
                          children: [
                            NormalText(
                              text: matchData.status,
                              fontSize: AppLayout.getHeight(10),
                              color: Pallete.blueColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    NormalText(
                                      text: matchData.homeTeam.shortName,
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
                                          padding: const EdgeInsets.all(5.0),
                                          child: homeTeamCrest),
                                    ),
                                  ],
                                ),
                                Gap(AppLayout.getWidth(2)),
                                Row(
                                  children: [
                                    NormalText(
                                      text: "${matchData.score.fullTime.home}",
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
                                      text: "${matchData.score.fullTime.away}",
                                      fontSize: AppLayout.getHeight(18),
                                      color: Pallete.blueColor,
                                    )
                                  ],
                                ),
                                Gap(AppLayout.getWidth(2)),
                                Row(
                                  children: [
                                    Container(
                                      height: AppLayout.getHeight(30),
                                      width: AppLayout.getHeight(30),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: awayTeamCrest),
                                    ),
                                    Gap(AppLayout.getWidth(2)),
                                    NormalText(
                                      text: matchData.awayTeam.shortName,
                                      fontSize: AppLayout.getHeight(10),
                                      color: Pallete.blueColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                }));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text("Error: $error"),
      ),
    );
  }
}
