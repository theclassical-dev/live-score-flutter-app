import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:livescore/common/loading_page.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/features/match/controller/match_controller.dart';
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
          horizontal: AppLayout.getWidth(10),
          vertical: AppLayout.getHeight(15)),
      child: ListView(
        children: [
          const LeagueCard(),
          NormalText(
            text: "Live",
            fontSize: AppLayout.getHeight(18),
            color: Pallete.redColor,
          )
        ],
      ),
    );
  }
}
