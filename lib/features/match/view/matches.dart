import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:livescore/common/healine_text.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/features/match/widget/all_match_list.dart';
import 'package:livescore/features/match/widget/match_news.dart';
import 'package:livescore/features/match/widget/match_widget.dart';
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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: const LeagueCard(),
            ),
            SliverToBoxAdapter(
              child: Gap(AppLayout.getHeight(30)),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Live',
                          style: GoogleFonts.aleo(
                            fontSize: AppLayout.getHeight(15),
                            color: Pallete.redColor,
                          ),
                          children: [
                            TextSpan(
                              text: ' Match',
                              style: GoogleFonts.aleo(
                                fontSize: AppLayout.getHeight(15),
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(AppLayout.getHeight(5)),
                      SpinKitPulse(
                        color: Pallete.redColor,
                        size: AppLayout.getHeight(10),
                      ),
                    ],
                  ),
                  NormalText(
                    text: "view all",
                    fontSize: AppLayout.getHeight(13),
                    color: const Color(0xFFCFA165),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Gap(AppLayout.getHeight(20)),
            ),
            const SliverToBoxAdapter(
              child: MatchCard(),
            ),
            SliverToBoxAdapter(
              child: Gap(AppLayout.getHeight(30)),
            ),
            SliverToBoxAdapter(
              child: Row(
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
                  GestureDetector(
                    child: NormalText(
                      text: "view all",
                      fontSize: AppLayout.getHeight(13),
                      color: Pallete.greyColor,
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(AppLayout.getHeight(20)),
                          ),
                        ),
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => const AllRecentResult(),
                      );
                    },
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Gap(AppLayout.getHeight(10)),
            ),
            const SliverToBoxAdapter(
              child: RecentResultList(),
            ),
            SliverToBoxAdapter(
              child: Gap(AppLayout.getHeight(30)),
            ),
            SliverToBoxAdapter(
              child: Row(
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
                  GestureDetector(
                    child: NormalText(
                      text: "view all",
                      fontSize: AppLayout.getHeight(13),
                      color: Pallete.greyColor,
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(AppLayout.getHeight(20)),
                          ),
                        ),
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => const AllMatchList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Gap(AppLayout.getHeight(10)),
            ),
            const SliverToBoxAdapter(
              child: MatchList(),
            ),
            SliverToBoxAdapter(
              child: Gap(AppLayout.getHeight(20)),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      NormalText(
                        text: "Latest News",
                        fontSize: AppLayout.getHeight(15),
                        color: Pallete.blueColor,
                      ),
                    ],
                  ),
                  NormalText(
                    text: "see all",
                    fontSize: AppLayout.getHeight(13),
                    color: Pallete.greyColor,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Gap(AppLayout.getHeight(20)),
            ),
            const SliverToBoxAdapter(
              child: MatchNews(),
            )
          ],
        ));
    //
    // ListView(
    //   children: [
    //     //league list widget
    //     const LeagueCard(),

    //     Gap(AppLayout.getHeight(30)),

    //     // live match headline widget
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Row(
    //           children: [
    //             RichText(
    //               text: TextSpan(
    //                 text: 'Live',
    //                 style: GoogleFonts.aleo(
    //                     fontSize: AppLayout.getHeight(15),
    //                     color: Pallete.redColor),
    //                 children: [
    //                   TextSpan(
    //                       text: ' Match',
    //                       style: GoogleFonts.aleo(
    //                           fontSize: AppLayout.getHeight(15),
    //                           color: Colors.black)),
    //                 ],
    //               ),
    //             ),
    //             Gap(AppLayout.getHeight(5)),
    //             SpinKitPulse(
    //               color: Pallete.redColor,
    //               size: AppLayout.getHeight(10),
    //             )
    //           ],
    //         ),
    //         NormalText(
    //           text: "view all",
    //           fontSize: AppLayout.getHeight(13),
    //           color: const Color(0xFFCFA165),
    //         )
    //       ],
    //     ),

    //     Gap(AppLayout.getHeight(20)),

    //     //live match card
    //     const MatchCard(),

    //     Gap(AppLayout.getHeight(30)),
    //     //Recent Results
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Row(
    //           children: [
    //             NormalText(
    //               text: "Recent Results",
    //               fontSize: AppLayout.getHeight(15),
    //               color: Pallete.blueColor,
    //             ),
    //           ],
    //         ),
    //         GestureDetector(
    //           child: NormalText(
    //             text: "view all",
    //             fontSize: AppLayout.getHeight(13),
    //             color: Pallete.greyColor,
    //           ),
    //           onTap: () {
    //             showModalBottomSheet(
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.vertical(
    //                     top: Radius.circular(AppLayout.getHeight(20))),
    //               ),
    //               context: context,
    //               isScrollControlled: true,
    //               builder: (context) => const AllRecentResult(),
    //             );
    //           },
    //         )
    //       ],
    //     ),
    //     Gap(AppLayout.getHeight(10)),
    //     const RecentResultList(),
    //     Gap(AppLayout.getHeight(30)),

    //     //match schedule list
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Row(
    //           children: [
    //             NormalText(
    //               text: "Match Schedule",
    //               fontSize: AppLayout.getHeight(15),
    //               color: Pallete.blueColor,
    //             ),
    //           ],
    //         ),
    //         GestureDetector(
    //           child: NormalText(
    //             text: "view all",
    //             fontSize: AppLayout.getHeight(13),
    //             color: Pallete.greyColor,
    //           ),
    //           onTap: () {
    //             showModalBottomSheet(
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.vertical(
    //                     top: Radius.circular(AppLayout.getHeight(20))),
    //               ),
    //               context: context,
    //               isScrollControlled: true,
    //               builder: (context) => const AllMatchList(),
    //             );
    //           },
    //         )
    //       ],
    //     ),
    //     Gap(AppLayout.getHeight(10)),
    //     const MatchList(),

    //     //match schedule list
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Row(
    //           children: [
    //             NormalText(
    //               text: "Match Schedule",
    //               fontSize: AppLayout.getHeight(15),
    //               color: Pallete.blueColor,
    //             ),
    //           ],
    //         ),
    //         NormalText(
    //           text: "view all",
    //           fontSize: AppLayout.getHeight(13),
    //           color: Pallete.greyColor,
    //         )
    //       ],
    //     ),
    //     Gap(AppLayout.getHeight(20)),
    //     SpinKitWaveSpinner(
    //       color: Color(0xFFf6f6f6),
    //       waveColor: Pallete.blueColor,
    //       size: AppLayout.getHeight(70),
    //     )
    //   ],
    // ),
    // );
  }
}
