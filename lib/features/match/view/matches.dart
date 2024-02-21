import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:livescore/common/healine_text.dart';
import 'package:livescore/common/normal_text.dart';
import 'package:livescore/core/core.dart';
import 'package:livescore/features/match/widget/all_match_list.dart';
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
                  NormalText(
                    text: "view all",
                    fontSize: AppLayout.getHeight(13),
                    color: Pallete.greyColor,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Gap(AppLayout.getHeight(20)),
            ),
            // SliverToBoxAdapter(
            //   child: SpinKitWaveSpinner(
            //     color: const Color(0xFFf6f6f6),
            //     waveColor: Pallete.blueColor,
            //     size: AppLayout.getHeight(70),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(5)),
                constraints: BoxConstraints(
                  minWidth: AppLayout.getWidth(200),
                  minHeight: AppLayout.getHeight(250),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: AppLayout.getHeight(10),
                    horizontal: AppLayout.getHeight(10)),
                decoration: BoxDecoration(
                  color: Pallete.blueColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: AppLayout.getHeight(150),
                        constraints:
                            BoxConstraints(minWidth: AppLayout.getWidth(400)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Pallete.whiteColor,
                          image: const DecorationImage(
                              image: AssetImage("assets/images/w1.png"),
                              fit: BoxFit.cover),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: AppLayout.getHeight(10),
                              right: AppLayout.getHeight(10),
                              child: NormalText(
                                text: "Sky Sport",
                                fontSize: AppLayout.getHeight(10),
                              ),
                            ),
                            Positioned(
                              bottom: AppLayout.getHeight(10),
                              left: AppLayout.getHeight(10),
                              child: NormalText(
                                text: "Author",
                                fontSize: AppLayout.getHeight(10),
                              ),
                            )
                          ],
                        ),
                      ),
                      Gap(AppLayout.getHeight(5)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(10)),
                        child: HeadlineText(
                          text:
                              "Mic'd Up: Why Newcastle were awarded penalty despite Schar offside",
                          color: Pallete.whiteColor,
                          fontsize: AppLayout.getHeight(13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppLayout.getWidth(10),
                            vertical: AppLayout.getWidth(5)),
                        child: NormalText(
                          text:
                              "In the latest Mic'd Up, PGMOL chief Howard Webb goes through incidents in Newcastle vs Bournemouth, Everton vs Spurs, Sheff Utd vs West Ham and more...",
                          fontSize: AppLayout.getHeight(9),
                        ),
                      ),
                    ]),
              ),
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
