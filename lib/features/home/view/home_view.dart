import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:livescore/constants/constants.dart';
import 'package:livescore/theme/theme.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  int _page = 0;

  final appBar = UIConstants.appBar();

  void onPageChanged(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: IndexedStack(
          index: _page,
          children: UIConstants.bottomTabBarPages,
        ),
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: _page,
          onTap: onPageChanged,
          backgroundColor: Pallete.backgroundColor,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _page == 0
                    ? AssetsContants.homeFilledIcon
                    : AssetsContants.homeOutlinedIcon,
                // ignore: deprecated_member_use
                color: Pallete.whiteColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsContants.homeOutlinedIcon,
                // ignore: deprecated_member_use
                color: Pallete.whiteColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _page == 2
                    ? AssetsContants.homeFilledIcon
                    : AssetsContants.homeOutlinedIcon,
                // ignore: deprecated_member_use
                color: Pallete.whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
