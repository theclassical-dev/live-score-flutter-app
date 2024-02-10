import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/core/utlis.dart';
import 'package:livescore/models/match.dart';
import 'package:livescore/theme/theme.dart';

class MatchList extends ConsumerWidget {
  const MatchList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final match = ref.watch(matchListProvider);
    // print(match);
    // print(UtilsExtension.getTodaysDate());
    // print(UtilsExtension.getFutureDate(10));

    return match.when(
      data: (matches) {
        //noted schedule is used in postman instead of timed
        List<MatchModel> filteredMatch =
            matches.where((match) => (match.status == 'TIMED')).toList();

        // print(filteredMatch);
        return SizedBox(
          height: filteredMatch.isEmpty ? 0 : AppLayout.getHeight(250),
          // height: 500,
          child: ListView.builder(
              itemCount: filteredMatch.length,
              // itemExtent: AppLayout.getHeight(90 + 5),
              itemBuilder: (context, index) {
                MatchModel matchData = filteredMatch[index];

                //crest hanlder
                Widget homeTeamCrest =
                    UtilsExtension.buildCrestImage(matchData.homeTeam.crest);
                Widget awayTeamCrest =
                    UtilsExtension.buildCrestImage(matchData.awayTeam.crest);

                // date handler
                Map<String, String> formattedDate =
                    UtilsExtension.formatDate(matchData.utcDate);
                return Container(
                    margin:
                        EdgeInsets.symmetric(vertical: AppLayout.getHeight(5)),
                    height: AppLayout.getHeight(80),
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
                      child: Row(
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
                          Column(
                            children: [
                              NormalText(
                                text: "${formattedDate['date']}",
                                fontSize: AppLayout.getHeight(10),
                                color: Pallete.blueColor,
                              ),
                              NormalText(
                                text: "${formattedDate['time']}",
                                fontSize: AppLayout.getHeight(10),
                                color: Pallete.blueColor,
                              ),
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
                    ));
              }),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text("Error: $error"),
      ),
    );
  }
}
