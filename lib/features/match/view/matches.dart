import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/features/match/widget/league_card.dart';
import 'package:livescore/features/match/widget/match_card.dart';
import 'package:livescore/features/match/widget/match_list.dart';
import 'package:livescore/features/match/widget/recent_results_list.dart';
import 'package:livescore/theme/theme.dart';

class MatchView extends ConsumerStatefulWidget {
  const MatchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MatchViewState();
}

class _MatchViewState extends ConsumerState<MatchView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(20),
          vertical: AppLayout.getHeight(20)),
      child: ListView(
        children: [
          //league list widget
          const LeagueCard(),

          Gap(AppLayout.getHeight(30)),

          // live match headline widget
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Live',
                      style: GoogleFonts.aleo(
                          fontSize: AppLayout.getHeight(15),
                          color: Pallete.redColor),
                      children: [
                        TextSpan(
                            text: ' Match',
                            style: GoogleFonts.aleo(
                                fontSize: AppLayout.getHeight(15),
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  Gap(AppLayout.getHeight(5)),
                  SpinKitPulse(
                    color: Pallete.redColor,
                    size: AppLayout.getHeight(10),
                  )
                ],
              ),
              NormalText(
                text: "view all",
                fontSize: AppLayout.getHeight(13),
                color: const Color(0xFFCFA165),
              )
            ],
          ),

          Gap(AppLayout.getHeight(20)),

          //live match card
          const MatchCard(),

          Gap(AppLayout.getHeight(20)),
//Recent Results
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  NormalText(
                    text: "Recent Results",
                    fontSize: AppLayout.getHeight(15),
                    color: Pallete.blueColor,
                  ),
                ],
              ),
              NormalText(
                text: "view all",
                fontSize: AppLayout.getHeight(13),
                color: Pallete.greyColor,
              )
            ],
          ),
          Gap(AppLayout.getHeight(20)),
          const RecentResultList(),
          // Gap(AppLayout.getHeight(10)),
          // const RecentResultList(),
          Gap(AppLayout.getHeight(20)),

          //match schedule list
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  NormalText(
                    text: "Match Schedule",
                    fontSize: AppLayout.getHeight(15),
                    color: Pallete.blueColor,
                  ),
                ],
              ),
              NormalText(
                text: "view all",
                fontSize: AppLayout.getHeight(13),
                color: Pallete.greyColor,
              )
            ],
          ),
          Gap(AppLayout.getHeight(20)),
          const MatchList(),

          //match schedule list
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  NormalText(
                    text: "Match Schedule",
                    fontSize: AppLayout.getHeight(15),
                    color: Pallete.blueColor,
                  ),
                ],
              ),
              NormalText(
                text: "view all",
                fontSize: AppLayout.getHeight(13),
                color: Pallete.greyColor,
              )
            ],
          ),
          Gap(AppLayout.getHeight(20)),
        ],
      ),
    );
  }
}
