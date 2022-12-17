import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:elice_mobile_team_pa/home/home.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController _pageController;
  int _currentIndex = 0;

  static const BOTTOM_NAV_HOME = "HOME";
  static const BOTTOM_NAV_QR = "QR";

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    _pageController = PageController(initialPage: _currentIndex);
  }

  void _onChangePage(index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(_currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      appBar: GlobalAppBar(
        title: const PurpleLogoAsset(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              color: AppColors.black.withOpacity(0.54),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
          const HomeContents(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.grey3,
        selectedItemColor: AppColors.purple2,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        currentIndex: _currentIndex,
        onTap: (index) => _onChangePage(index),
        items: const [
          BottomNavigationBarItem(
            label: BOTTOM_NAV_HOME,
            icon: Icon(
              Icons.account_balance,
            ),
          ),
          BottomNavigationBarItem(
            label: BOTTOM_NAV_QR,
            icon: Icon(
              Icons.camera_alt_outlined,
            ),
          )
        ],
      ),
    );
  }
}
