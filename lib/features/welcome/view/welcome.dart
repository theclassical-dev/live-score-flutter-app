import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:livescore/features/home/view/home_view.dart';
import 'package:livescore/theme/theme.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _postion;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 1000));

    _postion = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0, 1))
          ..addListener(() {
            setState(() {});
          }));

    _opacity = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0, 1))
          ..addListener(() {
            setState(() {});
          }));

    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Pallete.backgroundColor,
          child: Stack(
            children: [
              Positioned(
                bottom: -100,
                child: Container(
                  width: size.width,
                  height: size.height + 250,
                  decoration: const BoxDecoration(
                      gradient: RadialGradient(radius: 0.85, colors: [
                    Pallete.backgroundColor,
                    Pallete.blueColor,
                  ])),
                ),
              ),

              //the ball above
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.all(50),
                  width: size.width,
                  child: Image.asset(
                    "assets/images/w2.png",
                    fit: BoxFit.cover,
                    color: Pallete.whiteColor,
                    // height: 100,
                  ),
                ),
              ),

              //the text
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  height: size.height / 2,
                  child: Column(children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "SCORELINE",
                          style: TextStyle(
                              color: Pallete.backgroundColor,
                              fontSize: 37,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "Get All Match Schedules and Live Scores \n",
                          style: TextStyle(
                              color: Pallete.backgroundColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    const Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (details) {
                        int sensitivity = 8;

                        if (details.delta.dy < -sensitivity) {
                          //if the icon is swipe up
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const Homeview(),
                                  type: PageTransitionType.bottomToTop));
                        }
                      },
                      child: AbsorbPointer(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 17),
                              child: Opacity(
                                opacity: _opacity.value,
                                child: const Icon(
                                  CommunityMaterialIcons.chevron_double_up,
                                  color: Pallete.whiteColor,
                                  size: 50,
                                ),
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                  text: "Explore",
                                  style: TextStyle(
                                      color: Pallete.whiteColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              )

              //
            ],
          ),
        ),
      ),
    );
  }
}
