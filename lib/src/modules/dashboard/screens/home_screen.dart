import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waves_crypto_app/src/modules/dashboard/screens/bottosheets/my_address_bottomsheet.dart';
import 'package:waves_crypto_app/src/modules/dashboard/widgets/available_balance_card.dart';
import 'package:waves_crypto_app/src/modules/dashboard/widgets/balance_switch.dart';
import 'package:waves_crypto_app/src/modules/dashboard/widgets/home_card.dart';
import 'package:waves_crypto_app/src/modules/dashboard/widgets/search_textfield.dart';
import 'package:waves_crypto_app/src/modules/dashboard/widgets/token_tile.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/spacing.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';
import 'package:waves_crypto_app/src/shared/widgets/appbars/custom_appbar.dart';
import 'package:waves_crypto_app/src/shared/widgets/appbars/custom_tabbar.dart';
import 'package:waves_crypto_app/src/shared/widgets/appbars/sliver_appbar_delegate.dart';
import 'package:waves_crypto_app/src/shared/widgets/tiles/custom_expansion_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffF8FAFB),
        appBar: CustomAppBar(
          leading: IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: AppColors.textDefault,
              size: 20.sp,
            ),
            onPressed: () {},
          ),
          actions: [
            Container(
              height: 30.h,
              width: 30.h,
              decoration: const BoxDecoration(
                color: AppColors.textDefault,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
          ],
        ),
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverPadding(
                padding: AppPadding.symetricHorizontalOnly,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wallet',
                        style: AppText.bold500(context).copyWith(
                          fontSize: 12.sp,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text(
                            'Mobile Team',
                            style: AppText.bold900(context).copyWith(
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.unfold_more_outlined,
                            color: AppColors.grey,
                            size: 15.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const _CardsSection(),
              const _TabsSection(),
            ];
          },
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              _TokensTabView(),
              _LeasingTabView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardsSection extends StatelessWidget {
  const _CardsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: SizedBox(
          height: 120.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.horizontal,
              vertical: 16.h,
            ),
            physics: const BouncingScrollPhysics(),
            children: [
              HomeCard(
                icon: icon(Icons.qr_code, color: Colors.white),
                label: 'Your address',
                backgroundColor: Colors.blue,
                onTap: () {
                  myAddressBottomSheet(context);
                },
              ),
              HomeCard(
                icon: icon(Icons.person_outlined),
                label: 'Aliases',
              ),
              const BalanceSwitch(),
              HomeCard(
                icon: icon(Icons.close_fullscreen),
                label: 'Receipts',
              )
            ],
          ),
        ),
      ),
    );
  }

  Icon icon(IconData icon, {Color? color}) {
    return Icon(
      icon,
      color: color ?? AppColors.textDefault,
      size: 20.sp,
    );
  }
}

class _TabsSection extends StatelessWidget {
  const _TabsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 25.h,
        maxHeight: 25.h,
        child: Container(
          color: const Color(0xffF8FAFB),
          child: const CustomTabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Tokens'),
              Tab(text: 'Leasing'),
            ],
          ),
        ),
      ),
    );
  }
}

class _TokensTabView extends StatelessWidget {
  const _TokensTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: AppPadding.horizontal,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SearchWidget(
                  onChanged: (query) {},
                  onClose: () {},
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.swap_vert,
                  color: AppColors.grey,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Wrap(
            direction: Axis.vertical,
            spacing: 8.h,
            children: List.generate(3, (index) => const TokenTile()),
          ),
          SizedBox(height: 16.h),
          CustomExpansionTile(
            label: 'Hidden tokens(2)',
            children: [
              Wrap(
                direction: Axis.vertical,
                spacing: 8.h,
                children: List.generate(2, (index) => TokenTile(width: 300.w)),
              ),
              SizedBox(height: 16.h),
            ],
          ),
          CustomExpansionTile(
            label: 'Suspicious tokens(15)',
            children: [
              Wrap(
                direction: Axis.vertical,
                spacing: 8.h,
                children: List.generate(3, (index) => TokenTile(width: 300.w)),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ],
      ),
    );
  }
}

class _LeasingTabView extends StatelessWidget {
  const _LeasingTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: AppPadding.horizontal,
      ),
      child: Column(
        children: [
          const AvailableBalanCard(),
          SizedBox(height: 8.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: AppColors.boxshadow,
              borderRadius: BorderRadius.circular(5.r),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.horizontal,
              vertical: 15.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View History',
                  style: AppText.bold600(context),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 20.sp,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
