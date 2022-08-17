import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/modules/dashboard/screens/home_screen.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';
import 'package:waves_crypto_app/src/shared/widgets/custom_bottomsheet.dart';

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
            icon: _plusButton(),
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

  Widget _plusButton() {
    return Container(
      height: 20.h,
      width: 20.h,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(.3),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Icon(
        Icons.add,
        color: AppColors.primary,
        size: 15.sp,
      ),
    );
  }
}

Future<dynamic> transactionBottomSheet(BuildContext context) {
  return showCustomBottomSheet(
    context: context,
    body: const _Body(),
  );
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetBody(
      content: [
        const Dragger(),
        SizedBox(height: 16.h),
      ],
    );
  }
}
