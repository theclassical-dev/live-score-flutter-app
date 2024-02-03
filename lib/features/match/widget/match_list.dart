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

    return match.when(
      data: (matches) {
        //noted schedule is used in postman instead of timed
        List<MatchModel> filteredMatch =
            matches.where((match) => (match.status == 'TIMED')).toList();
        return SizedBox(
          height: AppLayout.getHeight(500),
          child: ListView.builder(
              itemCount: filteredMatch.length,
              itemBuilder: (context, index) {
                MatchModel matchData = filteredMatch[index];
                Widget homeTeamCrest =
                    ImageExtension.buildCrestImage(matchData.homeTeam.crest);
                Widget awayTeamCrest =
                    ImageExtension.buildCrestImage(matchData.awayTeam.crest);
                return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                                fontSize: AppLayout.getHeight(13),
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
                                fontSize: AppLayout.getHeight(13),
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
