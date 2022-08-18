import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/modules/dashboard/screens/home_screen.dart';
import 'package:waves_crypto_app/src/modules/dashboard/screens/bottosheets/transaction_options_bottomsheet.dart';
import 'package:waves_crypto_app/src/modules/dashboard/widgets/navbar_button.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      transactionBottomSheet(context);
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 30,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.textDefault,
        unselectedItemColor: AppColors.grey.withOpacity(.3),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: AppText.bold400(context).copyWith(
          fontSize: 14.sp,
        ),
        unselectedLabelStyle: AppText.bold400(context).copyWith(
          fontSize: 14.sp,
        ),
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.repeat),
            label: 'Authorizations',
          ),
          BottomNavigationBarItem(
            icon: NavBarButton(
              icon: Icons.add,
              iconColor: AppColors.primary,
              backgroundColor: AppColors.primary.withOpacity(.3),
            ),
            label: 'Authorizations',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_outlined),
            label: 'Authorizations',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}
