import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:livescore/common/loading_page.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/core/utlis.dart';
import 'package:livescore/models/leagues.dart';
import 'package:livescore/theme/theme.dart';

class LeagueCard extends ConsumerWidget {
  const LeagueCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final league = ref.watch(leagueListProvider);
    return league.when(
      data: (leagues) {
        List<League> filteredLeagues = leagues
            .where(
                (league) => !['BSA', 'CLI', 'PPL', 'DED'].contains(league.code))
            .take(10)
            .toList();

        // print(league);
        // List<League> filteredLeagues = leagues
        // .where((league) =>
        //     (league.type == 'LEAGUE' || league.type == 'CUP') &&
        //     (league.name.contains('Premier') ||
        //         league.name.contains('Championship') ||
        //         league.name.contains('La Liga') ||
        //         league.name.contains('Champions League') ||
        //         league.name.contains('Ligue 1') ||
        //         league.name.contains('Bundesliga')))
        // .toList();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(0.0)),
          child: Row(
            children: filteredLeagues.map((league) {
              String imageUrl = league.emblem;
              String fileExtension = UtilsExtension.getFileExtension(imageUrl);

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                height: AppLayout.getHeight(60),
                constraints: BoxConstraints(minWidth: AppLayout.getWidth(200)),
                decoration: BoxDecoration(
                  color: Pallete.blueColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Pallete.blueColor),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: AppLayout.getWidth(10),
                      right: AppLayout.getWidth(10)),
                  child: Row(
                    children: [
                      Container(
                        height: AppLayout.getHeight(51),
                        width: AppLayout.getHeight(51),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: fileExtension == 'svg'
                              // ignore: deprecated_member_use
                              ? SvgPicture.network(
                                  league.emblem,
                                )
                              : Image.network(
                                  league.emblem,
                                  color: league.name == "Championship" ||
                                          league.name == "Bundesliga" ||
                                          league.code == "SA"
                                      ? null
                                      : Colors.white,
                                ),
                        ),
                      ),
                      Gap(AppLayout.getHeight(5)),
                      NormalText(
                        text: league.code == 'PD'
                            ? "LA LIGA"
                            : league.name.toUpperCase(),
                        fontSize: AppLayout.getHeight(18),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
      loading: () => const LoadingPage(),
      error: (error, stack) => Center(
        child: Text("Error: $error"),
      ),
    );
  }
}
