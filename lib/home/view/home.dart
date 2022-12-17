import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      appBar: const GlobalAppBar(),
      body: PageView(
        children: [
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "HOME",
            icon: Icon(
              Icons.account_balance,
            ),
          ),
          BottomNavigationBarItem(
            label: "QR",
            icon: Icon(
              Icons.camera_alt_outlined,
            ),
          )
        ],
      ),
    );
  }
}
