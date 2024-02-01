import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/features/match/widget/league_card.dart';
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

          Gap(AppLayout.getHeight(15)),

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
                color: Color(0xFFCFA165),
              )
            ],
          ),
        ],
      ),
    );
  }
}
