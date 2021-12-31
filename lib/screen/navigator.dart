import 'package:assignment/app_utils/app_colors.dart';
import 'package:assignment/app_utils/app_images.dart';
import 'package:assignment/app_utils/app_strings.dart';
import 'package:assignment/app_utils/app_styles.dart';
import 'package:assignment/controllers/agents_controller.dart';
import 'package:assignment/screen/pages/home.dart';
import 'package:assignment/screen/pages/talk_to_astro.dart';
import 'package:assignment/screen/pages/under_development.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

//Bottom Navigation Page
class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key key}) : super(key: key);

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const TalkToAstro(),
    UnderDevelopment(isAppBar: true,),
    UnderDevelopment(isAppBar: true,),
  ];
  final List<BottomNavigationBarItem> _items = [
    //Home Page Tab
    BottomNavigationBarItem(
      icon: SizedBox(
        height: 22.0,
        width: 22.0,
        child: Image.asset(AppImages.homeDisable, height: 25.0, width: 25.0),
      ),
      activeIcon: SizedBox(
        height: 22.0,
        width: 22.0,
        child: Image.asset(AppImages.homeImage, height: 25.0, width: 25.0),
      ),
      label: AppStrings.home,
    ),
    //Ask Astrologer Page
    BottomNavigationBarItem(
      icon: SizedBox(
        height: 22.0,
        width: 22.0,
        child: Image.asset(AppImages.talk, height: 25.0, width: 25.0),
      ),
      activeIcon: SizedBox(
        height: 22.0,
        width: 22.0,
        child: Image.asset(AppImages.askAstroEnable, height: 25.0, width: 25.0),
      ),
      label: AppStrings.talkToAstro,
    ),
    //Ask Question Page
    BottomNavigationBarItem(
      icon: SizedBox(
        height: 22.0,
        width: 22.0,
        child: Image.asset(AppImages.askImage, height: 25.0, width: 25.0),
      ),
      activeIcon: SizedBox(
        height: 22.0,
        width: 22.0,
        child: Image.asset(AppImages.askEnable, height: 25.0, width: 25.0),
      ),
      label: AppStrings.askQuestion,
    ),
    //Report Page
    BottomNavigationBarItem(
      icon: SizedBox(
        height: 22.0,
        width: 22.0,
        child: Image.asset(AppImages.reports, height: 25.0, width: 25.0),
      ),
      activeIcon: SizedBox(
        height: 22.0,
        width: 22.0,
        child: Image.asset(AppImages.reportEnable, height: 25.0, width: 25.0),
      ),
      label: AppStrings.report,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _items,
        currentIndex: _currentIndex,
        backgroundColor: AppColors.whiteColor,
        selectedItemColor: AppColors.baseOrange,
        unselectedItemColor: AppColors.grey0,
        unselectedLabelStyle: AppStyles.black10Regular,
        selectedLabelStyle: AppStyles.black10Regular,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedFontSize: 10.0,
        selectedFontSize: 10.0,
        onTap: (index) {
          if (index == 1) {
            Provider.of<AgentController>(context, listen: false)
                .fetchAvailableAgents();
          }
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
